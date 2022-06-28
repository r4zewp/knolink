import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/config.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';

class CustomerRepository {
  final Dio _dio = DioSingleton().instance();

  Future<dynamic> applyCustomer(
      String id, String uname, String authCode, String phone) async {
    try {
      final params = {
        'Id': id,
        'Name': uname,
        'TelNum': phone,
        'AuthCode': authCode,
      };
      final _res = await _dio.post(
        "$rootUrl/api/Auth/customersignup",
        data: jsonEncode(params),
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
      );
      if (_res.statusCode == 200) {
        return _res.data;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
