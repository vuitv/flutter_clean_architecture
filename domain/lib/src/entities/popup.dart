class Popup {
  final int id;
  final String? name;
  final String? imageUrl;
  final String? deepLink;
  final int? screenId;
  final String? status;

  Popup({
    required this.id,
    this.name,
    this.imageUrl,
    this.deepLink,
    this.screenId,
    this.status,
  });
}
