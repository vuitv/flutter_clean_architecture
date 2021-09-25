library data;

import 'src/di/locator.dart';

class Data {
  static Future init() async {
    await setupLocator();
  }
}
