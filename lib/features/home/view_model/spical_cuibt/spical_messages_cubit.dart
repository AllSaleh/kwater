import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
part 'spical_messages_state.dart';

class SpicalMessagesCubit extends Cubit<SpicalMessagesState> {
  final MessagesRepo messagesRepo;
  SpicalMessagesCubit(this.messagesRepo) : super(SpicalMessagesInitial());

  Future<void> getSpical() async {
    var response = await messagesRepo.getSpical();

    response.fold((failue) {
      emit(SpicalMessagesFailure(errorMessage: failue.errorMessage));
    }, (messages) {
      emit(SpicalMessagesISucsess(messages: messages));
    });
  }
}
