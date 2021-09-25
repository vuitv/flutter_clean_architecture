import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

import 'metadata_model.dart';

class ListResponseModel<T> extends ListResponse<T> {
  ListResponseModel({
    required Metadata metadata,
    required List<T> data,
  }) : super(
          metadata: metadata,
          data: data,
        );

  factory ListResponseModel.fromJson(
    String key,
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) factoryFunction,
  ) {
    final metadataJson = Utils.parseJson('metadata', json);
    final dataList = Utils.parseJsonToList(key, json, factoryFunction);
    return ListResponseModel(
      metadata: MetadataModel.fromJson(metadataJson),
      data: dataList,
    );
  }
}
