import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/config.dart';
import 'package:knolink/datasources/models/Order.dart';
import 'package:knolink/datasources/models/Tutor.dart';
import '../core/dio_singleton.dart';

class OrderRepository {
  final Dio _dio = DioSingleton().instance();

  Future<bool> createOrder(String token, String uid, String subject,
      String desc, String type) async {
    /// json data to send
    final params = jsonEncode(
      {
        "CustomerId": uid,
        "Subject": subject,
        "Description": desc,
        "Type": type,
      },
    );
    try {
      final res = await _dio.post("$rootUrl/api/Order",
          data: params,
          options: Options(
            headers: {'Authorization': "Bearer $token"},
          ));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Order>> getOpenOrdersByCustomerId(String token) async {
    List<Order> activeOrders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetByCustomerId",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        if (order["status"] == "open") {
          activeOrders.add(Order.fromResponse(order));
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return activeOrders;
  }

  Future<List<Order>> getClosedOrdersByCustomerId(String token) async {
    List<Order> closedOrders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetByCustomerId",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        if (order["status"] == "closed") {
          closedOrders.add(Order.fromResponse(order));
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return closedOrders;
  }

  Future<List<Order>> getAllOrdersBySubject(
      String token, String subject) async {
    List<Order> orders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetBySubject",
        queryParameters: {
          'subject': subject,
        },
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        orders.add(Order.fromResponse(order));
      }
      return orders;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Order>> getOpenOrdersByTutorId(String token) async {
    List<Order> activeOrders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetByTutorId",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        if (order["status"] == "open") {
          activeOrders.add(Order.fromResponse(order));
        }
      }
      return activeOrders;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Order>> getClosedOrdersByTutorId(String token) async {
    List<Order> closedOrders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetByTutorId",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        if (order["status"] == "closed") {
          closedOrders.add(Order.fromResponse(order));
        }
      }
      return closedOrders;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Order>> getAllOrdersForTutor(String token) async {
    List<Order> orders = [];
    try {
      final res = await _dio.get(
        "$rootUrl/api/Order/GetAll",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      for (var order in res.data) {
        orders.add(Order.fromResponse(order));
      }
      return orders;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> followOrder(String oid, String price, String token) async {
    try {
      final params = jsonEncode(
        {
          "OrderId": oid,
          "Price": price,
        },
      );
      final response = await _dio.post(
        "$rootUrl/api/Order/PostResponse",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          contentType: "application/json",
        ),
        data: params,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Tutor>> getTutorsForOrder(String token, String oid) async {
    List<Tutor> tutors = [];
    try {
      final response = await _dio.get(
        "$rootUrl/api/Order/GetRespondedTutors",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        for (var tutor in response.data) {
          tutors.add(Tutor.fromResponse(response));
        }
        return tutors;
      } else {
        return tutors;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
