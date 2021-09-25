import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bottom_bar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<AppBottomBarBloc>().state;
    final unselectedItemColor = BottomNavigationBarTheme.of(context).unselectedItemColor;

    return BottomNavigationBar(
      currentIndex: currentIndex.index,
      onTap: (index) {
        context.read<AppBottomBarBloc>().emit(BottomBarIndex.values[index]);
      },
      items: [
        CustomBottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
            color: currentIndex != BottomBarIndex.home ? unselectedItemColor : null,
          ),
          label: Strings.tr.home,
        ),
        CustomBottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.tickets,
            color: currentIndex != BottomBarIndex.coupon ? unselectedItemColor : null,
          ),
          label: Strings.tr.coupon,
        ),
        CustomBottomNavigationBarItem(
          iconSize: CustomBottomNavigationBarItem.iconSizeCenter,
          marginBottom: 4,
          icon: Icon(
            CupertinoIcons.bag_fill_badge_plus,
            color: currentIndex != BottomBarIndex.shopping ? unselectedItemColor : null,
            size: 36,
          ),
          label: Strings.tr.shopping,
        ),
        CustomBottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.book,
            color: currentIndex != BottomBarIndex.newFeed ? unselectedItemColor : null,
          ),
          label: Strings.tr.newFeed,
        ),
        CustomBottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            color: currentIndex != BottomBarIndex.user ? unselectedItemColor : null,
          ),
          label: Strings.tr.user,
        ),
      ],
    );
  }
}

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  static const iconSize = 25.0;
  static const iconSizeCenter = 45.0;

  CustomBottomNavigationBarItem({
    double iconSize = iconSize,
    double marginBottom = 8,
    required Widget icon,
    String? label,
  }) : super(
          label: label,
          icon: Container(
            width: iconSizeCenter,
            height: iconSizeCenter,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: iconSize,
              height: iconSize,
              margin: EdgeInsets.only(bottom: marginBottom),
              child: icon,
            ),
          ),
        );
}
