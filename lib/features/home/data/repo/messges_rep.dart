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
}

class MessagesRepoIm implements MessagesRepo {
  SqlHeper sqlHeper = SqlHeper();
  @override
  Future<Either<Failure, List<CustomMessgesModel>>> getMessges(
      {required int id}) async {
    try {
      var response = await sqlHeper.readdata(
          'SELECT  * FROM messages JOIN categoris ON messages.id_categorie=categoris.categories_id WHERE messages.id_categorie=$id');

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
  Future<Either<Failure, List<CustomMessgesModel>>> searchMessges(
      {required String message, required String categorie}) async {
    try {
      var response = await sqlHeper.readdata(
          "SELECT * FROM messages JOIN categoris ON messages.id_categorie=categoris.categories_id WHERE messages.message LIKE '%$message%' AND messages.message_status=0 AND categoris.categorie='$categorie'");
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
}
