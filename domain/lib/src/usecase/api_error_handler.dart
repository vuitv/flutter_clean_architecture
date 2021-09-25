import 'package:dio/dio.dart';

import '../repositories/api_error_handler_repo.dart';

class ApiErrorHandle {
  final ApiErrorHandleRepo _repo;

  ApiErrorHandle(this._repo);

  void call(Interceptor interceptor) {
    _repo.getError(interceptor);
  }
}
