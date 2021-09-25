import 'package:dio/dio.dart';

import 'base/api_client.dart';

abstract class PopupApi {
  Future<Response> getFloatPopup();
}

class PopupApiImpl implements PopupApi {
  final ApiClient client;

  PopupApiImpl(this.client);

  @override
  Future<Response> getFloatPopup() {
    return client.get('/popup/default');
  }
}
