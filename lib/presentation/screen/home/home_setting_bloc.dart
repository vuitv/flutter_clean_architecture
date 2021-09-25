import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSettingBloc extends BlocBase<ScreenSetting> {
  final GetHomeScreenSetting getHomeSetting;
  static const initState = const ScreenSetting(
    text: 'Tìm kiếm sản phẩm...',
    color: '#949494',
  );

  HomeSettingBloc(this.getHomeSetting) : super(initState) {
    init();
  }

  Future init() async {
    final result = await getHomeSetting();
    result.when(success: emit);
  }
}
