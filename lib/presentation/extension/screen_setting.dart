import 'dart:ui';

import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

extension ScreenSettingExt on ScreenSetting {
  Color? get colorForHex => Utils.hexColor(this.color ?? '');
}
