import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/api/end_points.dart';

import 'package:khwater/core/api/handlig_errors.dart';
import 'package:khwater/features/drwer_pages/add_messges/data/add_repo/add_repo.dart';

class AddRepoIm implements AddRepo {
  final DioHelper dioHelper;

  AddRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, dynamic>> addMessage(
      {required int id, required String message}) async {
    var formData = FormData.fromMap({'message': message, 'id': id});
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoints.addMessage, formData: formData);

      if (response['status'] == true) {
        return right(true);
      } else {
        return left(Diohandling(''));
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
  Future<Either<Failure, dynamic>> addCategorie({required String categorie})async {
     var formData = FormData.fromMap({'categorie': categorie, });
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoints.addCategorie, formData: formData);

      if (response['status'] == true) {
        return right(true);
      } else {
        return left(Diohandling('existing'.tr()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(Diohandling.fromDioError(e));
      } else {
        return left(Diohandling(e.toString()));
      }
    }
  
  }
}
