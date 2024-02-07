

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
part 'messages_options_state.dart';

class MessagesOptionsCubit extends Cubit<MessagesOptionsState> {
  final MessagesRepo messagesRepo;
  MessagesOptionsCubit(this.messagesRepo) : super(MessagesOptionsInitial());


  Future<void> addFaviort({required int id}) async {
    var response = await messagesRepo.addFaviorte(id: id);
    response.fold((failure) {
      emit(MessagesOptionsFailure(errorMessage: failure.errorMessage));
    }, (sucsess) {
      emit(
          MessagesOptionsSucsess());
    });
  }

  Future<void> deleteFaviort({required int id}) async {
    var response = await messagesRepo.removeFaviorte(id: id);
    response.fold((failure) {
      emit(MessagesOptionsFailure(errorMessage: failure.errorMessage));
    }, (sucsess) {
      emit(MessagesOptionsSucsess(
      ));
    });
  }
}
