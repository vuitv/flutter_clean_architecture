import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

class RegionModel extends Region {
  const RegionModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: Utils.parseJsonToInt('id', json)!,
      name: Utils.parseJson<String>('name', json)!,
    );
  }

  static List<RegionModel> fromList(List json) {
    return Utils.listFromJson(
      json,
      (item) => RegionModel.fromJson(item),
    );
  }
}
