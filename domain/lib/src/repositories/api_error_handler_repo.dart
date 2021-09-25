import 'package:dio/dio.dart';

abstract class ApiErrorHandleRepo {
  void getError(Interceptor interceptor);
}
