import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

import '../screen/app/app_bloc.dart';
import '../screen/app_bottom_bar/app_bottom_bar_bloc.dart';
import '../screen/home/home_bloc.dart';
import '../screen/home/home_setting_bloc.dart';
import '../screen/popup/floating_popup/floating_popup_bloc.dart';
import '../screen/popup/region/region_bloc.dart';
import '../screen/shopping/shopping_bloc.dart';
import '../screen/shopping/shopping_setting_bloc.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator() async {
  _registerBloc();
  await Data.init();
  Domain.init();
}

void _registerBloc() {
  locator.registerFactory(() => AppBloc(
        apiErrorHandle: locator(),
        getRegions: locator(),
        region: locator(),
      ));
  locator.registerFactory(() => AppBottomBarBloc());

  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(() => ShoppingBloc(locator()));
  locator.registerFactory(() => RegionBloc(
        locator(),
        locator(),
      ));

  locator.registerFactory(() => FloatingPopupBloc(locator()));

  ///Home page
  locator.registerFactory(() => HomeSettingBloc(locator()));

  ///Shopping page
  locator.registerFactory(() => ShoppingSettingBloc(locator()));
}
