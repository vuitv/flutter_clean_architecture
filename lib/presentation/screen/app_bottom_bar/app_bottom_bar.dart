import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import '../../values/sizes.dart';
import '../home/home_screen.dart';
import '../shopping/shopping_screen.dart';
import 'app_bottom_bar_bloc.dart';
import 'widget/custom_bottom_navigation_bar.dart';

class AppBottomBarScreen extends StatelessWidget {
  const AppBottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AppBottomBarBloc>(),
      child: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  List<Widget> pages = <Widget>[
    HomeScreen(),
    Center(child: Text('Coupon')),
    ShoppingScreen(),
    Center(child: Text('BeeFeed')),
    Center(child: Text('Cá nhân')),
  ];

  late List<Key> destinationKeys;
  late List<AnimationController> faders;
  late AnimationController hideBottomBar;

  @override
  void initState() {
    super.initState();
    faders = List<AnimationController>.generate(
      pages.length,
      (_) => AnimationController(
        vsync: this,
        duration: kThemeAnimationDuration,
      ),
    );
    faders[context.read<AppBottomBarBloc>().state.index].value = 1.0;
    destinationKeys = List<Key>.generate(
      pages.length,
      (int index) => GlobalKey(),
    ).toList();
    hideBottomBar = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    );
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      hideBottomBar.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Sizes.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(750, 1450),
    );
  }

  @override
  void dispose() {
    for (AnimationController controller in faders) controller.dispose();
    hideBottomBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<AppBottomBarBloc>().state;

    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != BottomBarIndex.shopping) {
          context.read<AppBottomBarBloc>().emit(BottomBarIndex.shopping);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: List<Widget>.generate(pages.length, (int index) {
            final Widget view = FadeTransition(
              opacity: faders[index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
              child: KeyedSubtree(
                key: destinationKeys[index],
                child: pages[index],
              ),
            );
            if (index == currentIndex.index) {
              faders[index].forward();
              return view;
            } else {
              faders[index].reverse();
              if (faders[index].isAnimating) {
                return IgnorePointer(child: view);
              }
              return Offstage(child: view);
            }
          }).toList(),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
