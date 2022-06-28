import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';

import '../core/config.dart';

class TutorRepository {
  final Dio _dio = DioSingleton().instance();

  Future<dynamic> applyTutor(String id, String uname, String uni,
      String authCode, String phone) async {
    try {
      final params = {
        'Id': id,
        'Name': uname,
        'TelNum': phone,
        'University': uni,
        'AuthCode': authCode,
      };
      print(id);
      print(uname);
      print(phone);
      print(uni);
      print(authCode);

      final _res = await _dio.post(
        "$rootUrl/api/Auth/tutorsignup",
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
