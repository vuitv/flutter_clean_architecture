import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_sliver_app_bar_delegate.dart';
import 'shopping_search_bar.dart';

class ShoppingSliverAppBar extends CustomSliverAppBarDelegate {
  ShoppingSliverAppBar()
      : super(
          expandedHeight: 300,
          title: const FlutterLogo(size: 24),
          leading: IconButton(
            onPressed: () {
              /// todo open category
            },
            splashRadius: 24,
            icon: const Icon(Icons.menu_rounded, size: 32),
          ),
          autoHideLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                ///todo open cart
              },
              splashRadius: 24,
              icon: Icon(CupertinoIcons.cart_fill),
            ),
          ],
          searchBar: const ShoppingSearchBar(),
        );
}
