import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_source/local/shared_preferences_store.dart';
import '../data_source/remote/base/api_client.dart';
import '../data_source/remote/popup_api.dart';
import '../data_source/remote/regions_api.dart';
import '../data_source/remote/screen_setting_api.dart';
import '../repository/api_error_handle_repo_impl.dart';
import '../repository/internet_status_repo_impl.dart';
import '../repository/popup_repo_impl.dart';
import '../repository/region_repo_impl.dart';
import '../repository/screen_setting_repo_impl.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator() async {
  await _registerExternal();
  await _registerApiServices();
  _registerNetworkModules();
  _registerRepository();
}

Future _registerRepository() async {
  locator.registerLazySingleton<InternetStatusRepo>(() => InternetStatusRepoImpl());
  locator.registerLazySingleton<ApiErrorHandleRepo>(() => ApiErrorHandleRepoImpl(locator()));

  locator.registerFactory<ScreenSettingRepo>(() => ScreenSettingRepoImpl(locator()));
  locator.registerLazySingleton<RegionRepo>(() => RegionRepoImpl(locator(), locator()));
  locator.registerFactory<PopupRepo>(() => PopupRepoImpl(locator()));
}

Future _registerApiServices() async {
  locator.registerLazySingleton<ScreenSettingApi>(() => ScreenSettingApiImpl(locator()));
  locator.registerFactory<RegionApi>(() => RegionApiImpl(locator()));
  locator.registerFactory<PopupApi>(() => PopupApiImpl(locator()));
}

void _registerNetworkModules() {
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator<Dio>()));
}

Future _registerExternal() async {
  final prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
  locator.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: locator<AppConfig>().baseUrl)));
  locator.registerSingleton(SharedPrefsStore(locator()));
  final packageInfo = await PackageInfo.fromPlatform();
  locator.registerSingleton<PackageInfo>(packageInfo);
}
