import 'package:dio/dio.dart';
import '../core/dio_singleton.dart';

class OrderRepository {
  final Dio _dio = DioSingleton().instance();
}
