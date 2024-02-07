
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
part 'faviorte_messages_state.dart';

class FaviorteMessagesCubit extends Cubit<FaviorteMessagesState> {
  final MessagesRepoIm messagesRepo;
  FaviorteMessagesCubit(this.messagesRepo) : super(FaviorteMessagesInitial());

  

  Future<void> getFaviorte() async {
    emit(FaviorteMessagesLoading());
    var response = await messagesRepo.getFaviorte();
    response.fold((failure) {
      emit(FaviorteMessagesFailure(errorMessage: failure.errorMessage));
    }, (messages) {
      emit(FaviorteMessagesGetSucsess(messages: messages));
    });
  }
}
