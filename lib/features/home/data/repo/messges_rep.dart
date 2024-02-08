import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khwater/core/api/handlig_errors.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';

abstract class MessagesRepo {
  Future<Either<Failure, List<CustomMessgesModel>>> getMessges(
      {required int id});
  Future<Either<Failure, List<CustomMessgesModel>>> searchMessges(
      {required String message, required String categorie});

  Future<Either<Failure, dynamic>> addFaviorte({required int id});
  Future<Either<Failure, dynamic>> removeFaviorte({required int id});
  Future<Either<Failure, List<CustomMessgesModel>>> getFaviorte();

  Future<Either<Failure, List<CustomMessgesModel>>> getSpical();
  Future<Either<Failure, List<CustomMessgesModel>>> getNew();

}

class MessagesRepoIm implements MessagesRepo {
  SqlHeper sqlHeper = SqlHeper();
  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getMessges(
      {required int id}) async {
    try {
      var response = await sqlHeper.readdata('''
SELECT * FROM
 (messages JOIN categoris ON messages.id_categorie=categoris.categories_id)
  JOIN faviorte ON messages.message_id=faviorte.faviorte_id WHERE messages.id_categorie=$id''');

      List<CustomMessgesModel> messages = [];
      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      if (messages.isEmpty) {
        return left(Diohandling('nomessages'.tr()));
      } else {
        return right(messages);
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomMessgesModel>>> searchMessges(
      {required String message, required String categorie}) async {
    try {
      var response = await sqlHeper.readdata(
          "SELECT * FROM(messages JOIN categoris ON messages.id_categorie=categoris.categories_id) JOIN faviorte ON messages.message_id=faviorte.faviorte_id WHERE messages.message LIKE '%$message%' AND messages.message_status=1 AND categoris.categorie='$categorie'");
      List<CustomMessgesModel> messages = [];

      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }

      if (messages.isEmpty) {
        return left(Diohandling('noData'.tr()));
      } else {
        return right(messages);
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addFaviorte({required int id}) async {
    try {
      var response = await sqlHeper.uPdatedata(
          'UPDATE faviorte SET isFaviorte=1 WHERE faviorte_id=$id ');
      if (response > 0) {
        return right(true);
      } else {
        return left(Diohandling('fiureAddingFavioret'.tr()));
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> removeFaviorte({required int id}) async {
    try {
      var response = await sqlHeper.uPdatedata(
          'UPDATE faviorte SET isFaviorte=0 WHERE faviorte_id=$id ');
      if (response > 0) {
        return right(true);
      } else {
        return left(Diohandling('fiuredeletingFavioret'.tr()));
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getFaviorte() async {
    try {
      var response = await sqlHeper.readdata('''
SELECT * FROM
 (messages JOIN categoris ON messages.id_categorie=categoris.categories_id)
  JOIN faviorte ON messages.message_id=faviorte.faviorte_id WHERE faviorte.isFaviorte=1''');

      List<CustomMessgesModel> messages = [];
      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      if (messages.isEmpty) {
        return left(Diohandling('nomessages'.tr()));
      } else {
        return right(messages);
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getSpical() async {
    try {
      var response = await sqlHeper.readdata('''
SELECT * FROM
 (messages JOIN categoris ON messages.id_categorie=categoris.categories_id)
  JOIN faviorte ON messages.message_id=faviorte.faviorte_id WHERE messages.spical=1''');

      List<CustomMessgesModel> messages = [];
      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      if (messages.isEmpty) {
        return left(Diohandling('nomessages'.tr()));
      } else {
        return right(messages);
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getNew() async{
   try {
      var response = await sqlHeper.readdata('''
SELECT * FROM
 (messages JOIN categoris ON messages.id_categorie=categoris.categories_id)
  JOIN faviorte ON messages.message_id=faviorte.faviorte_id WHERE messages.is_new=1''');

      List<CustomMessgesModel> messages = [];
      for (var item in response) {
        messages.add(CustomMessgesModel.fromJson(item));
      }
      if (messages.isEmpty) {
        return left(Diohandling('nomessages'.tr()));
      } else {
        return right(messages);
      }
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
