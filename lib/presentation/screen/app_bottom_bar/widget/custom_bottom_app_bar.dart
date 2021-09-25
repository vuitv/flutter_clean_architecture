import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bottom_bar_bloc.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<AppBottomBarBloc>().state;
    //final unselectedItemColor = BottomNavigationBarTheme.of(context).unselectedItemColor;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomAppBarItem(
              onPressed: () => context.read<AppBottomBarBloc>().emit(BottomBarIndex.home),
              isActive: currentIndex == BottomBarIndex.home,
              label: Strings.tr.home,
              icon: Icon(CupertinoIcons.home),
            ),
            BottomAppBarItem(
              onPressed: () => context.read<AppBottomBarBloc>().emit(BottomBarIndex.coupon),
              isActive: currentIndex == BottomBarIndex.coupon,
              label: Strings.tr.coupon,
              icon: Icon(CupertinoIcons.tickets),
            ),
            BottomAppBarItem(
              isActive: currentIndex == BottomBarIndex.shopping,
              onPressed: () => null,
              label: Strings.tr.shopping,
              icon: SizedBox(),
            ),
            BottomAppBarItem(
              onPressed: () => context.read<AppBottomBarBloc>().emit(BottomBarIndex.newFeed),
              isActive: currentIndex == BottomBarIndex.newFeed,
              label: Strings.tr.newFeed,
              icon: Icon(CupertinoIcons.book),
            ),
            BottomAppBarItem(
              onPressed: () => context.read<AppBottomBarBloc>().emit(BottomBarIndex.user),
              isActive: currentIndex == BottomBarIndex.user,
              label: Strings.tr.user,
              icon: Icon(CupertinoIcons.person),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  static const iconSizeCenter = 45.0;

  const BottomAppBarItem({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onPressed,
    this.label,
    this.iconSize = 25,
    this.marginBottom = 6,
  }) : super(key: key);

  final Function() onPressed;
  final Widget icon;
  final String? label;
  final double iconSize;

  final double marginBottom;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final selectedLabelStyle = BottomNavigationBarTheme.of(context).selectedLabelStyle;
    final unselectedLabelStyle = BottomNavigationBarTheme.of(context).unselectedLabelStyle;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: Column(children: [
            Container(
              width: iconSize,
              height: iconSize,
              margin: EdgeInsets.only(bottom: marginBottom),
              child: icon,
            ),
          ]),
        ),
        if (label != null) Text(label!, style: isActive ? selectedLabelStyle : unselectedLabelStyle)
      ],
    );
  }
}
