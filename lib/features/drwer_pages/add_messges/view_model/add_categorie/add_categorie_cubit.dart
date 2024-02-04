import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:khwater/features/drwer_pages/add_messges/data/add_repo/add_repo_im.dart';

part 'add_categorie_state.dart';

class AddCategorieCubit extends Cubit<AddCategorieState> {
  AddCategorieCubit(this.addRepoIm) : super(AddCategorieInitial());
  final AddRepoIm addRepoIm;

  InternetConnectionChecker internetConnectionCheck =
      InternetConnectionChecker();

  TextEditingController categorie = TextEditingController();

  Future<void> addCategorie() async {
    if (categorie.text == '') {
      emit(AddCategorieFailure(errorMessage: 'enterCategorie'.tr()));
    } else {
      emit(AddCategorieLoading());

      if (await internetConnectionCheck.hasConnection) {
        var response = await addRepoIm.addCategorie(categorie: categorie.text);

        response.fold((failure) {
          emit(AddCategorieFailure(errorMessage: failure.errorMessage));
        }, (sucsess) {
          emit(AddCategorieSucsess());
        });
      } else {
        emit(AddCategorieFailure(errorMessage: 'interNetConntction'.tr()));
      }
    }
  }
}
