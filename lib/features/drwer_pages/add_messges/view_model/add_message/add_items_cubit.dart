import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/drwer_pages/add_messges/data/add_repo/add_repo_im.dart';
import 'package:khwater/features/home/data/model/categoriss_model.dart';

part 'add_items_state.dart';

class AddItemsCubit extends Cubit<AddItemsState> {
  final AddRepoIm addRepoIm;
  AddItemsCubit(this.addRepoIm) : super(AddItemsInitial());

  final SqlHeper _sqlHeper = SqlHeper();
  List<CategorissModel> categories = [];
  TextEditingController message = TextEditingController();
  TextEditingController categorie = TextEditingController();
  num? id;

  InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  Future<void> getCaterorisess() async {
    var response = await _sqlHeper.readdata('select * from categoris');
    for (var item in response) {
      categories.add(CategorissModel.fromJson(item));
    }
    emit(AddItemsSucsess());
  }

  Future<void> addMessage() async {
    if (id == null) {
      emit(AddItemsNoCategorie(errorMessage: 'chooseCateg'.tr()));
    } else if (message.text == '') {
      emit(AddItemsNoCategorie(errorMessage: 'noMessge'.tr()));
    } else {
      emit(AddItemsLoading());
      if (await internetConnectionChecker.hasConnection) {
        var response =
            await addRepoIm.addMessage(id: id!.toInt(), message: message.text);
        response.fold((failure) {
          emit(AddItemsFailure(errorMessage: failure.errorMessage));
        }, (sucsess) {
          emit(AddItemsAddeddSucsess());
        });
      } else {
        emit(AddItemsFailure(errorMessage: 'interNetConntction'.tr()));
      }
    }
  }
}
