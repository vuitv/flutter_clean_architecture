import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

typedef ResponseToModel<Model> = Model Function(dynamic);

abstract class BaseRepository {
  Future<Result<Model>> safeApiCall<Model>(
    Future<Response> call, {
    required ResponseToModel<Model> mapper,
  }) async {
    try {
      var response = await call;
      return Success<Model>(mapper.call(response.data));
    } on Exception catch (exception) {
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(ErrorType.POOR_NETWORK, 'Hãy kiểm tra kết nối mạng của bạn!');

          case DioErrorType.other:
            return Error(ErrorType.NO_NETWORK, 'Không có kết nối Internet!');

          case DioErrorType.response:
            return ServerError(
              type: ErrorType.SERVER,
              error: exception.message,
              code: exception.response!.statusCode!,
            );
        }
      }
      return Error(ErrorType.GENERIC, "Xảy ra lỗi, hãy thử lại!");
    }
  }
}
