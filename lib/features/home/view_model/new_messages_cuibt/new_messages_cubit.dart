

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
part 'new_messages_state.dart';

class NewMessagesCubit extends Cubit<NewMessagesState> {
  final MessagesRepo messagesRepo;
  NewMessagesCubit(this.messagesRepo) : super(NewMessagesInitial());



  Future<void> getNewMessages()async{
    var response=await messagesRepo.getNew();

    response.fold((failure) {
      emit( NewMessagesFailure(errorMessage: failure.errorMessage));

    }, (messages){
      emit(NewMessagesSucsess(messages: messages));
      
    });
  }
}
