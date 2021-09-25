library core;

import 'src/config/app_config.dart';
import 'src/di/locator.dart';

export 'src/config/app_config.dart';
export 'src/localizations/languages.dart';
export 'src/localizations/localizations_delegate.dart';
export 'src/localizations/strings.dart';

class Core {
  static void init(Environment environment) {
    setupLocator(environment);
  }
}
