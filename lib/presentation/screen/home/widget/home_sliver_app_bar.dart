import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_sliver_app_bar_delegate.dart';
import 'home_search_bar.dart';

class HomeSliverAppBar extends CustomSliverAppBarDelegate {
  HomeSliverAppBar()
      : super(
          expandedHeight: 300,
          title: FlutterLogo(),
          leading: IconButton(
            onPressed: () => null,
            splashRadius: 24,
            icon: const Icon(
              CupertinoIcons.app_badge,
              size: 24,
            ),
          ),
          autoHideLeading: false,
          actions: [
            IconButton(
              onPressed: () => null,
              splashRadius: 24,
              icon: Icon(CupertinoIcons.cart),
            ),
          ],
          searchBar: const HomeSearchBar(),
        );
}
