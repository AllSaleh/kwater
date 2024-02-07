import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/api/end_points.dart';

import 'package:khwater/core/api/handlig_errors.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/model/messages_model.dart';
import 'package:khwater/features/home/data/repo/home_repo.dart';
import 'package:khwater/main.dart';

class HomeRepoIm implements HomeRepo {
  final DioHelper dioHelper;

  HomeRepoIm({required this.dioHelper});
  SqlHeper sqlHeper = SqlHeper();

  @override
  Future<Either<Failure, List<MessagesModel>>> getMessagesOnline() async {
    var localData = await sqlHeper.readdata('select * from messages');
    List res = localData;

    List locaCategorie = await sqlHeper.readdata('select * from categoris');
    var getfaviorte = await sqlHeper.readdata('select * from faviorte');
    List faviorte = getfaviorte;

    List<MessagesModel> items = [];

    try {
      var response = await dioHelper.getData(endPoint: EndPoints.home);

      if (response['status'] == true) {
        for (var item in response['messages']) {
          sqlHeper.updateMessage(item, item['message_id']);
        }

        for (var categorie in response['categoris']) {
          Set<dynamic> uniqueData = Set<dynamic>.from(
              locaCategorie.map((item) => item['categories_id']));
          if (!uniqueData.contains(categorie['categories_id'])) {
            sqlHeper.addCategorie(categorie);
          }
        }

        for (var item in response['messages']) {
          Set<dynamic> uniqueData =
              Set<dynamic>.from(res.map((item) => item['message_id']));

          if (!uniqueData.contains(item['message_id'])) {
            sqlHeper.addMessage(item);
          }
        }
        for (var item in response['messages']) {
          Set<dynamic> uniqueData =
              Set<dynamic>.from(faviorte.map((item) => item['faviorte_id']));

          if (!uniqueData.contains(item['message_id'])) {
            sqlHeper.addFaviore({'faviorte_id': item['message_id']});
          }
        }
          sharedPrefe.setBool('hasData', true);
        return right(items);
      } else {
        return left(Diohandling('nomessages'.tr()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(Diohandling.fromDioError(e));
      } else {
 
        return left(Diohandling(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getNewMessages() async {
    try {
      var response = await sqlHeper.readdata(
          'SELECT * FROM (messages JOIN categoris ON messages.id_categorie=categoris.categories_id) JOIN faviorte ON messages.message_id=faviorte.faviorte_id where messages.is_new=1 ');

      List<CustomMessgesModel> messages = [];

      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      return right(messages);
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getSpicalMessages() async {
    try {
      var response = await sqlHeper.readdata(
          'SELECT * FROM (messages JOIN categoris ON messages.id_categorie=categoris.categories_id) JOIN faviorte ON messages.message_id=faviorte.faviorte_id where messages.spical=1 ');

      List<CustomMessgesModel> messages = [];

      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      return right(messages);
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
