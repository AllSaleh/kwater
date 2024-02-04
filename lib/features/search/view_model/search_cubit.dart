import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/search/data/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepIm) : super(SearchInitial());

  TextEditingController messge = TextEditingController();
  final SearchRepIm searchRepIm;

  Future<void> searchMessage() async {

    emit(SearchLoading());
    var response = await searchRepIm.featchMessges(messge: messge.text);

    response.fold((failure) {
      emit(SearchNodata(errorMessage: failure.errorMessage));
      
    }, (messages) {
      emit(SearchSucsess(messages: messages));
    });
  }
}
