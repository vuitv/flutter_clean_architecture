part of '../../../presentation/screen/app/app_bloc.dart';

class AppState extends Equatable {
  final Region? region;

  const AppState({
    this.region,
  });

  @override
  List<Object?> get props => [region];

  AppState copyWith({
    Region? region,
  }) {
    return AppState(
      region: region ?? this.region,
    );
  }

  String get regionName => region?.id == Region.idSouthern ? 'Miền Nam' : 'Miền Bắc';
}
