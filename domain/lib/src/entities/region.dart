import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final int id;
  final String name;

  const Region({
    required this.id,
    required this.name,
  });

  static const int idNorthern = 1;
  static const int idSouthern = 2;

  static List<Region> defaultRegions = <Region>[
    const Region(
      id: idNorthern,
      name: 'Miền Bắc',
    ),
    const Region(
      id: idSouthern,
      name: 'Miền Nam',
    ),
  ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
