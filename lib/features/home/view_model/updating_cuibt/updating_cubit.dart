import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/functions/cheek_internet.dart';
import 'package:khwater/features/home/data/repo/home_repo.dart';
part 'updating_state.dart';

class UpdatingCubit extends Cubit<UpdatingState> {
  final HomeRepo homeRepo;
  UpdatingCubit(this.homeRepo) : super(UpdatingInitial());

  Future<void> getOnlineData() async {
    if (await isConnection()) {
      var response = await homeRepo.getMessagesOnline();
      response.fold((failure) {
        emit(UpdatingFailure(errorMessage: failure.errorMessage));
      }, (sucsess) {
        
        emit(UpdatingSucsess(sucessMessage: 'updatingSucsess'.tr()));
      });
    } else {
      emit(UpdatingFailure(errorMessage: 'interNetConntction'.tr()));
    }
  }
}
