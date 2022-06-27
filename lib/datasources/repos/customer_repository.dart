import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';

class CustomerRepository {
  final Dio _dio = DioSingleton().instance();
  
}
