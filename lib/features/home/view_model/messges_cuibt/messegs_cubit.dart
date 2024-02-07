import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';

part 'messegs_state.dart';

class MessegsCubit extends Cubit<MessegsState> {
  MessegsCubit(this.messagesRepo) : super(MessegsInitial());

  final MessagesRepo messagesRepo;
  String? categorie;
  TextEditingController message = TextEditingController();
  

  Future<void> getCustomMessages({required int id, required String cat}) async {
    categorie = cat;

    var response = await messagesRepo.getMessges(id: id);
    response.fold((faliue) {
      emit(MessegsFailure(errorMessage: faliue.errorMessage));
    }, (messages) {
      emit(MessegsSucsess(messages));
    });
  }

  Future<void> getSearchMessges() async {
    var response = await messagesRepo.searchMessges(
        message: message.text, categorie: categorie!);

    response.fold((failure) {
      emit(MessegsFailure(errorMessage: failure.errorMessage));
    }, (searchMessages) {
      emit(MessegsSucsessSearch(searchMessages: searchMessages));
    });
  }

 
  
}
