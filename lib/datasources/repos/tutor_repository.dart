import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';

class TutorRepository {
  final Dio _dio = DioSingleton().instance();
}
