import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import '../popup/floating_popup/floating_popup.dart';
import 'home_bloc.dart';
import 'home_setting_bloc.dart';
import 'widget/home_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<HomeSettingBloc>()),
      ],
      child: _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: HomeSliverAppBar(),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 1000,
                    color: Colors.white,
                  ),
                ]),
              ),
            ],
          ),
        ),
        const FloatingPopup(),
      ],
    );
  }
}
