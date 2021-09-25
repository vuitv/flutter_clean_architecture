import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BlocBase {
  final GetHomeScreenSetting getScreenSetting;

  HomeBloc(this.getScreenSetting) : super(null);
}
