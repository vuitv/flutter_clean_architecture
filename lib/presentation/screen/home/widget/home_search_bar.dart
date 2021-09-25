import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extension/screen_setting.dart';
import '../../../widgets/search_bar.dart';
import '../home_setting_bloc.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSettingBloc, ScreenSetting>(
      buildWhen: (prev, current) => prev.text != current.text || prev.color != current.color,
      builder: (_, state) => SearchBarWithRegion(
        onPressed: () {
          // Todo goto search screen
        },
        label: state.text ?? '',
        labelStyle: TextStyle(color: state.colorForHex),
      ),
    );
  }
}
