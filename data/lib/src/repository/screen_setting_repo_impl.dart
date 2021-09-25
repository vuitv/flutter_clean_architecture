import 'package:domain/domain.dart';

import '../data_source/remote/screen_setting_api.dart';
import '../models/screen_setting_model.dart';
import 'base/base_repository.dart';

class ScreenSettingRepoImpl extends BaseRepository implements ScreenSettingRepo {
  final ScreenSettingApi _remoteApi;

  ScreenSettingRepoImpl(this._remoteApi);

  @override
  Future<Result<ScreenSetting>> getHomeSetting() {
    return safeApiCall<ScreenSetting>(
      _remoteApi.getHomeSetting(),
      mapper: (data) => ScreenSettingModel.fromJson(data),
    );
  }

  @override
  Future<Result<ScreenSetting>> getShoppingSetting() {
    return safeApiCall<ScreenSetting>(
      _remoteApi.getShoppingSetting(),
      mapper: (data) => ScreenSettingModel.fromJson(data),
    );
  }
}
