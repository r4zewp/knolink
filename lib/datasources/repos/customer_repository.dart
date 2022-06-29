import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/config.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';
import 'package:knolink/datasources/models/Customer.dart';

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

  Future<Customer> getCustomer(String token) async {
    try {
      final res = await _dio.get(
        "$rootUrl/api/Customer",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (res.statusCode == 200) {
        final customer = Customer.fromResponse(res.data[0]);
        return customer;
      } else {
        throw Exception("Unexpected auth error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
