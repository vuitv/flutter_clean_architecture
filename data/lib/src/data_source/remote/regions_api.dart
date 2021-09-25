import 'package:dio/dio.dart';

import 'base/api_client.dart';

abstract class RegionApi {
  Future<Response> regions();

  Future<Response> regionById(int id);
}

class RegionApiImpl implements RegionApi {
  final ApiClient client;

  RegionApiImpl(this.client);

  @override
  Future<Response> regions() {
    return client.get('/regions');
  }

  @override
  Future<Response> regionById(int id) {
    return client.get('/regions/$id');
  }
}
