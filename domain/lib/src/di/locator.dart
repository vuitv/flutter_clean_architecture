import 'package:get_it/get_it.dart';

import '../../domain.dart';

final locator = GetIt.instance..allowReassignment = true;

void setupLocator() {
  /// Use case
  locator.registerFactory(() => CheckInternetStatus(locator<InternetStatusRepo>()));
  locator.registerFactory(() => ApiErrorHandle(locator<ApiErrorHandleRepo>()));
  locator.registerFactory(() => GetRegions(locator<RegionRepo>()));
  locator.registerFactory(() => GetRegionsLocal(locator<RegionRepo>()));
  locator.registerFactory(() => GetRegion(locator<RegionRepo>()));
  locator.registerFactory(() => UpdateRegion(locator<RegionRepo>()));
  locator.registerFactory(() => GetHomeScreenSetting(locator<ScreenSettingRepo>()));
  locator.registerFactory(() => GetShoppingScreenSetting(locator<ScreenSettingRepo>()));
  locator.registerFactory(() => GetFloatPopup(locator<PopupRepo>()));
}
