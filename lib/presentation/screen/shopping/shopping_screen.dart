import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import 'shopping_bloc.dart';
import 'shopping_setting_bloc.dart';
import 'widget/shopping_sliver_app_bar.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<ShoppingBloc>()),
        BlocProvider(create: (_) => locator<ShoppingSettingBloc>()),
      ],
      child: _ShoppingScreenBody(),
    );
  }
}

class _ShoppingScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: ShoppingSliverAppBar(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 10000,
                  color: Colors.white,
                ),
              ]),
            ),
          ],
        ),
      ),
    ]);
  }
}
