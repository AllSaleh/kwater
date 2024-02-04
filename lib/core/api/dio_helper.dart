import 'dart:convert';
import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'http://192.168.10.180/khwater';

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
