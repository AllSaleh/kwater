import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khwater/core/api/handlig_errors.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';

abstract class SearchRep {
  Future<Either<Failure, List<CustomMessgesModel>>> featchMessges(
      {required String messge});
}

class SearchRepIm implements SearchRep {
  SqlHeper sqlHeper = SqlHeper();
  @override
  Future<Either<Failure, List<CustomMessgesModel>>> featchMessges(
      {required String messge}) async {
    try {
      var response = await sqlHeper.readdata(
          "SELECT * FROM messages JOIN categoris ON messages.id_categorie=categoris.categories_id WHERE message LIKE '%$messge%' AND message_status=0");

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
