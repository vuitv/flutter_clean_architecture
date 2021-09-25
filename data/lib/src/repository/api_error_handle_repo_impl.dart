import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiErrorHandleRepoImpl implements ApiErrorHandleRepo {
  final Dio _dio;

  ApiErrorHandleRepoImpl(this._dio);

  @override
  void getError(interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
