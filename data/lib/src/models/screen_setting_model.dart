import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

class ScreenSettingModel extends ScreenSetting {
  ScreenSettingModel({
    final String? backgroundUrl,
    final String? color,
    final String? footBackgroundUrl,
    final String? noticeDeliveryEpidemic,
    final String? text,
  }) : super(
          backgroundUrl: backgroundUrl,
          color: color,
          footBackgroundUrl: footBackgroundUrl,
          text: text,
        );

  factory ScreenSettingModel.fromJson(Map<String, dynamic> json) {
    return ScreenSettingModel(
      backgroundUrl: Utils.parseJson('background_url', json),
      color: Utils.parseJson('color', json),
      footBackgroundUrl: Utils.parseJson('foot_background_url', json),
      text: Utils.parseJson('text', json),
    );
  }
}
