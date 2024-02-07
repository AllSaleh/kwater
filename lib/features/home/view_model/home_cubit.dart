import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/functions/cheek_internet.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/model/categoriss_model.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/model/messages_model.dart';
import 'package:khwater/features/home/data/repo/home_repo.dart';
import 'package:khwater/features/home/views/faviorte.dart';
import 'package:khwater/features/home/views/new.dart';
import 'package:khwater/features/home/views/spical.dart';
import 'package:khwater/features/home/views/widgets/categorisess_gird.dart';
import 'package:khwater/main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoIm) : super(HomeInitial());
  final HomeRepo homeRepoIm;

  SqlHeper sqlHeper = SqlHeper();
  int index = 0;
  List<MessagesModel> messages = [];
  List<CategorissModel> categories = [];

  void changeIndex({required int newIndex}) async{
    index = newIndex;
    emit(HomeSucsess(categories: await getAllCategorisess()));
  }

  List<Widget> pages = const [
    CategorisessGrid(),
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

  Future<void> getHomeFunction() async {
    emit(HomeLoading());

    if (sharedPrefe.getBool('updating') == true ||
        sharedPrefe.getBool('updating') == null) {
      if (await isConnection()) {
        var response = await homeRepoIm.getMessagesOnline();
        response.fold((failure) {
          emit(HomeFailure(errorMessage: failure.errorMessage));
        }, (sucsess) async {
          emit(HomeSucsess(categories: await getAllCategorisess()));
          if (sharedPrefe.getBool('updating') == null) {
            sharedPrefe.setBool('updating', false);
          }
        });
      } else {
        emit(HomeFailure(errorMessage: 'interNetConntction'.tr()));
      }
    } else {
      emit(HomeSucsess(categories: await getAllCategorisess()));
    }
  }

  Future<List<CategorissModel>> getAllCategorisess() async {
    var response = await sqlHeper.readdata('select * from categoris');
    categories.clear();
    for (var item in response) {
      categories.add(CategorissModel.fromJson(item));
    }
    return categories;
  }

 


  


}
