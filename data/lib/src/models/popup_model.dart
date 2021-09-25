import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

class PopupModel extends Popup {
  PopupModel({
    required int id,
    String? name,
    String? imageUrl,
    String? deepLink,
    int? screenId,
    String? status,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          deepLink: deepLink,
          screenId: screenId,
          status: status,
        );

  factory PopupModel.fromJson(Map<String, dynamic> json) {
    return PopupModel(
      id: Utils.parseJsonToInt('id', json)!,
      name: Utils.parseJson<String>('name', json),
      imageUrl: Utils.parseJson<String>('image_url', json),
      deepLink: Utils.parseJson<String>('deep_link', json),
      screenId: Utils.parseJsonToInt('screen_id', json),
      status: Utils.parseJson<String>('status', json),
    );
  }

  static List<PopupModel> fromList(List json) {
    return Utils.listFromJson(
      json,
      (item) => PopupModel.fromJson(item),
    );
  }
}
