import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

class MetadataModel extends Metadata {
  MetadataModel({
    int total = 0,
    int page = 0,
    int limit = 0,
  }) : super(
          total: total,
          page: page,
          limit: limit,
        );

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      total: Utils.parseJsonToInt('total', json)!,
      page: Utils.parseJsonToInt('page', json)!,
      limit: Utils.parseJsonToInt('limit', json)!,
    );
  }
}
