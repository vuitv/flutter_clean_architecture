import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_region.dart';

class SearchBarWithRegion extends SearchBar {
  const SearchBarWithRegion({
    required Function() onPressed,
    required String label,
    TextStyle? labelStyle,
    BorderRadiusGeometry? borderRadius,
    Widget? prefixIcon,
    Widget suffixIcon = const ChooseRegion(),
  }) : super(
          onPressed: onPressed,
          label: label,
          labelStyle: labelStyle,
          borderRadius: borderRadius,
          suffixIcon: suffixIcon,
        );
}

class SearchBar extends StatelessWidget {
  static const double height = 40;

  final Function() onPressed;
  final String label;
  final TextStyle? labelStyle;
  final BorderRadiusGeometry? borderRadius;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  const SearchBar({
    Key? key,
    required this.onPressed,
    required this.label,
    this.labelStyle,
    this.borderRadius,
    this.prefixIcon = const Icon(
      CupertinoIcons.search,
      size: 22,
      color: Color(0xffBCBCBC),
    ),
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(18),
          ),
        ),
        child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: prefixIcon,
          ),
          Expanded(
              child: Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: labelStyle,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: suffixIcon,
          ),
        ]),
      ),
    );
  }
}
