import 'dart:convert';
import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'Here is Api Url';

  final Dio _dio = Dio();

  Future getData({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl/$endPoint',options:_options );

    return jsonDecode(response.data);
  }

  Future postData({required String endPoint, required dynamic formData}) async {
    var response = await _dio.post('$_baseUrl/$endPoint', data: formData,options: _options);

    return jsonDecode(response.data);
  }

  Options _options=Options(
    sendTimeout:const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    
  );
}
