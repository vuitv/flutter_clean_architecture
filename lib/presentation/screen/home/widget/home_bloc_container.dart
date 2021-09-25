import 'package:flutter/material.dart';

class HomeBlocContainer extends StatelessWidget {
  final Widget? child;

  const HomeBlocContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16).copyWith(right: 8),
      child: child,
    );
  }
}
