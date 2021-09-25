import 'metadata.dart';

class ListResponse<T> {
  final Metadata metadata;
  final List<T> data;

  ListResponse({
    required this.metadata,
    required this.data,
  });
}
