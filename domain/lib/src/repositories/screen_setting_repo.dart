import '../common/result.dart';
import '../entities/screen_setting.dart';

abstract class ScreenSettingRepo {
  Future<Result<ScreenSetting>> getHomeSetting();

  Future<Result<ScreenSetting>> getShoppingSetting();
}
