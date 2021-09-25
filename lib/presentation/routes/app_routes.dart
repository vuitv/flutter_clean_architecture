import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screen/app_bottom_bar/app_bottom_bar.dart';
import 'routes.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final routeObserver = RouteObserver<PageRoute>();

  static Map<String, WidgetBuilder> routes = {};

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    WidgetBuilder? builder;

    switch (settings.name) {
      case Routes.init:
        builder = (context) => AppBottomBarScreen();
        break;

      default:
        break;
    }

    if (builder != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }

    return null;
  }
}
