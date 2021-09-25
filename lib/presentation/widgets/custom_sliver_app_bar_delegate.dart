import 'dart:math';

import 'package:flutter/material.dart';

import '../values/sizes.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  static double defaultExpandedHeight = kToolbarHeight * 2 + Sizes().statusBarHeight - 10;

  CustomSliverAppBarDelegate({
    double? expandedHeight,
    required this.searchBar,
    this.background,
    this.title,
    List<Widget>? actions,
    this.leading,
    this.backgroundColor,
    this.autoHideLeading,
  })  : this.expandedHeight = expandedHeight ?? defaultExpandedHeight,
        this.actions = actions?..add(SizedBox(width: 4));

  final Widget? title;
  final Widget? background;
  final Widget searchBar;
  final List<Widget>? actions;
  final Widget? leading;
  final double expandedHeight;
  final Color? backgroundColor;
  final bool? autoHideLeading;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shrinkOffsetPosition = min(40, shrinkOffset / (maxExtent - minExtent) * 40).toDouble();
    final double show = shrinkOffset / maxExtent;
    final double hide = 1 - shrinkOffset / maxExtent;
    return Stack(children: [
      if (background != null) background!,
      AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: autoHideLeading != null
            ? IgnorePointer(
                ignoring: (autoHideLeading! ? hide : show) < 0.9,
                child: Opacity(
                  opacity: autoHideLeading! ? hide : show,
                  child: leading,
                ),
              )
            : leading,
        title: title != null
            ? Opacity(
                opacity: hide,
                child: title,
              )
            : null,
        actions: actions,
      ),
      Positioned(
        left: 8 + shrinkOffsetPosition,
        right: 8 + shrinkOffsetPosition,
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: searchBar,
        ),
      ),
    ]);
  }

  @override
  double get maxExtent => defaultExpandedHeight;

  @override
  double get minExtent => kToolbarHeight + Sizes().statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
