import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/model/categoriss_model.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/model/messages_model.dart';
import 'package:khwater/features/home/data/repo/home_repo.dart';
import 'package:khwater/features/home/views/faviorte.dart';
import 'package:khwater/features/home/views/new.dart';
import 'package:khwater/features/home/views/spical.dart';
import 'package:khwater/features/home/views/widgets/categorisess_gird.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoIm, this._internetConnectionChecker)
      : super(HomeInitial());
  final HomeRepo homeRepoIm;
  final InternetConnectionChecker _internetConnectionChecker;
  SqlHeper sqlHeper = SqlHeper();
  int index = 0;
  List<MessagesModel> messages = [];
  List<CategorissModel> categories = [];

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(HomeInitial());
  }

  List<Widget> pages = const [
    CategorisessGrid(),
    //  CustomItemsListBuilder(),
    NewITems(),
    Special(),
    Faviorte()
  ];
  Future<List<MessagesModel>> getAllMessages() async {
    var response = await sqlHeper.readdata('select * from messages');
    for (var item in response) {
      messages.add(MessagesModel.fromJson(item));
    }
    return messages;
  }

  Future<List<CategorissModel>> getAllCategorisess() async {
    var response = await sqlHeper.readdata('select * from categoris');
    categories.clear();
    for (var item in response) {
      categories.add(CategorissModel.fromJson(item));
    }
    return categories;
  }

  Future<void> getMessages() async {
    if (await _internetConnectionChecker.hasConnection) {
      var response = await homeRepoIm.getMessagesOnline();
   
      emit(HomeSucsess(
        
          categories: await getAllCategorisess()));

      response.fold((failure) {}, (messages) {});
    } else {
      
      emit(HomeSucsess(
        
          categories: await getAllCategorisess()));
    }
  }

  getCategorisee()async{
    emit(HomeSucsess(categories: await getAllCategorisess()));
  }

  Future<void> getNewMessages() async {
    var response = await homeRepoIm.getNewMessages();

    response.fold((l) => null, (messages) {
      
      
      emit(HomeSucsessNew(messages: messages));
    });
  }
Future<void> getSpicalMessages() async {
    var response = await homeRepoIm.getSpicalMessages();

    response.fold((l) => null, (messages) {
      
      
      emit(HomeSucsessSpical(messages: messages));
    });
  }
  chanePage({required int index}){
    if(index==0){
      return getCategorisee();
    }
    else if(index==1){
      return getNewMessages();
    }
    else if (index ==2){
      return getSpicalMessages();
    }
  }

  
}
