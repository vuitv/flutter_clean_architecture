import 'error_type.dart';

class Result<T> with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;

  Result<T> transform({
    required T Function(T)? success,
    Error<T> Function(Error<T>)? error,
  }) {
    if (this is Success<T> && success != null) {
      (this as Success<T>).data = success.call((this as Success<T>).data);
    }
    if (this is Error<T> && error != null) {
      return error.call(this as Error<T>);
    }
    return this;
  }
}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  ErrorType type;
  String message;

  Error(this.type, this.message);
}

class ServerError<T> extends Error<T> {
  int code;

  ServerError({
    required ErrorType type,
    required String error,
    required this.code,
  }) : super(type, error);
}

abstract class SealedResult<T> {
  R? when<R>({
    R Function(T)? success,
    R Function(Error)? error,
  }) {
    if (this is Success<T>) {
      return success?.call((this as Success).data);
    }
    if (this is Error<T>) {
      return error?.call(this as Error);
    }
    throw new Exception('If you got here, probably you forgot to regenerate the classes? '
        'Try running flutter packages pub run build_runner build');
  }
}
