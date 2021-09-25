import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const int kApiConnectTimeout = 1000;

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.options.connectTimeout = kApiConnectTimeout;
    _dio.options.receiveTimeout = kApiConnectTimeout;
    _dio.options.sendTimeout = kApiConnectTimeout;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ));
    } else {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onResponse: (Response response, handle) {
            return handle.next(response);
          },
          onError: (DioError error, handle) {
            if (error.response != null) {
              /// add log
            }
            return handle.next(error);
          },
        ),
      );
    }
  }

  Future<Response<T>> get<T>(
    String uri, {
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    return await _dio.get<T>(
      uri,
      queryParameters: params,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(
      uri,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> delete<T>(
    String uri, {
    Map<String, dynamic>? params,
  }) async {
    return await _dio.delete(
      uri,
      queryParameters: params,
    );
  }

  Future<Response<T>> put<T>(
    String uri, {
    data,
    Map<String, dynamic>? params,
  }) async {
    return await _dio.put(
      uri,
      data: data,
      queryParameters: params,
    );
  }
}
