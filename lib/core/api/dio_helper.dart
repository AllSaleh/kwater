import 'dart:convert';
import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'https://emmystore1.com/khwater';

  final Dio _dio = Dio();

  Future getData({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl/$endPoint');

    return jsonDecode(response.data);
  }

  Future postData({required String endPoint, required dynamic formData}) async {
    var response = await _dio.post('$_baseUrl/$endPoint', data: formData);
    

    return jsonDecode(response.data);
  }
}
