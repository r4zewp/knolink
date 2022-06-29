import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';
import 'package:knolink/datasources/models/Tutor.dart';

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
      final res = await _dio.post(
        "$rootUrl/api/Auth/tutorsignup",
        data: jsonEncode(params),
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
      );
      if (res.statusCode == 200) {
        final token = res.data.toString();
        return token;
      } else if (res.statusCode == 400) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Tutor> getTutor(String token) async {
    final res = await _dio.get(
      "$rootUrl/api/Tutor",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (res.statusCode == 200) {
      final tutor = Tutor.fromResponse(res.data[0]);
      return tutor;
    } else {
      throw Exception("Unexpected auth error");
    }
  }
}
