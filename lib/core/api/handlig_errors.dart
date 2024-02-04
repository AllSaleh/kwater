import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage );
}

class Diohandling extends Failure {
  Diohandling(super.errorMessage);

 

  factory Diohandling.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Diohandling("فشلة مهلة الاتصال");
      case DioExceptionType.sendTimeout:
        return Diohandling('فشلة مهلة الاتصال');
      case DioExceptionType.receiveTimeout:
        return Diohandling('فشلة مهلة');
      case DioExceptionType.badResponse:
        return dioHandlinResponse(
            error.response!.statusCode, error.response!.data);

      case DioExceptionType.connectionError:
        return Diohandling('مشكلة في اتصال السيرفر');
      case DioExceptionType.cancel:
        return Diohandling('cancel');

      default:
        return Diohandling('الرجاء المحاوله');
    }
  }
}

dioHandlinResponse(int? statusCode, dynamic response) {
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    //can changes
    return Diohandling(response['error']['message']);
  } else if (statusCode == 404) {
    return Diohandling('Your request not found, Please try later!');
  } else if (statusCode == 500) {
    return Diohandling('Internal Server error, Please try later');
  } else {
    return Diohandling('Opps There was an Error, Please try again');
  }
}
