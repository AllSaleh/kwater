import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Diohandling extends Failure {
  Diohandling(super.errorMessage);

  factory Diohandling.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Diohandling('connectionTimeOut'.tr());
      case DioExceptionType.sendTimeout:
        return Diohandling('sendTimeOut'.tr());
      case DioExceptionType.receiveTimeout:
        return Diohandling('receiveTimeout'.tr());
      case DioExceptionType.badResponse:
        return dioHandlinResponse(
            error.response!.statusCode, error.response!.data);

      case DioExceptionType.connectionError:
        return Diohandling('connectionError'.tr());
      case DioExceptionType.cancel:
        return Diohandling('cancelConnection'.tr());

      default:
        return Diohandling('connectionError'.tr());
    }
  }
}

dioHandlinResponse(int? statusCode, dynamic response) {
  
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    //can changes
    return Diohandling('problem'.tr());
  } else if (statusCode == 404) {
    return Diohandling('problem'.tr());
  } else if (statusCode == 500) {
    return Diohandling('problem'.tr());
  } else {
    return Diohandling('connectionError'.tr());
  }
}
