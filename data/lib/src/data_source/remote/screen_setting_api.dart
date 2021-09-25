import 'package:dio/dio.dart';

import 'base/api_client.dart';

abstract class ScreenSettingApi {
  Future<Response> getHomeSetting();

  Future<Response> getShoppingSetting();
}

class ScreenSettingApiImpl implements ScreenSettingApi {
  final ApiClient client;

  ScreenSettingApiImpl(this.client);

  @override
  Future<Response> getHomeSetting() {
    return client.get('/home');
  }

  @override
  Future<Response> getShoppingSetting() {
    return client.get('/shopping');
  }
}
