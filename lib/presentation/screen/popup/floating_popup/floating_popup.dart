import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/locator.dart';
import '../../../values/sizes.dart';
import 'floating_popup_bloc.dart';

class FloatingPopup extends StatelessWidget {
  const FloatingPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<FloatingPopupBloc>(),
      child: _FloatingPopupDrag(),
    );
  }
}

class _FloatingPopupDrag extends StatefulWidget {
  @override
  _FloatingPopupDragState createState() => _FloatingPopupDragState();
}

class _FloatingPopupDragState extends State<_FloatingPopupDrag> with TickerProviderStateMixin {
  static const double bottomPadding = 16;
  static const double imgSize = 100;
  static const double padding = 15;
  static const double extraSpace = imgSize / 2 + padding;

  static double get extraSpaceVerBottom => extraSpace + kBottomNavigationBarHeight + bottomPadding;

  double get extraSpaceVerTop => extraSpace + (kToolbarHeight * 2 + MediaQuery.of(context).padding.top);

  Offset position = Offset(
    Sizes().screenWidth - extraSpace,
    Sizes().screenHeight - extraSpaceVerBottom - bottomPadding,
  );
  late Animation<double> _animation;
  late AnimationController _animationController;

  void onPressed(Popup? popup) {
    if (popup?.deepLink == null) return;
    // todo navigate page
  }

  @override
  void initState() {
    super.initState();
    context.read<FloatingPopupBloc>().init();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popup = context.watch<FloatingPopupBloc>().state;
    if (popup == null) return SizedBox();
    return Positioned(
      top: position.dy - extraSpace,
      left: position.dx - extraSpace,
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        onTap: () => onPressed(popup),
        child: Stack(alignment: Alignment.topRight, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(padding),
            child: Container(
              width: imgSize,
              height: imgSize,
              child: FlutterLogo(),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: const Color(0xFFA4A4A4),
            ),
            padding: EdgeInsets.zero,
            onPressed: () => context.read<FloatingPopupBloc>().emit(null),
          ),
        ]),
      ),
    );
  }

  void _animateToEdge({double? from, double? to}) {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Sizes().screenWidth ~/ 0.6),
    );
    _animation = Tween<double>(
      begin: from,
      end: to,
    ).chain(CurveTween(curve: Curves.easeOutBack)).animate(_animationController)
      ..addListener(() {
        setState(() {
          position = Offset(_animation.value, position.dy);
        });
      });
    _animationController.forward();
  }

  void _moveToLeftEdge() {
    _animateToEdge(
      from: position.dx,
      to: extraSpace,
    );
  }

  void _moveToRightEdge() {
    _animateToEdge(
      from: position.dx,
      to: Sizes().screenWidth - extraSpace,
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      position = details.globalPosition;
      if (position.dx + extraSpace > Sizes().screenWidth)
        position = Offset(Sizes().screenWidth - extraSpace, position.dy);
      if (position.dx - extraSpace < 0) position = Offset(extraSpace, position.dy);
      if (position.dy + extraSpaceVerBottom > Sizes().screenHeight)
        position = Offset(position.dx, Sizes().screenHeight - extraSpaceVerBottom);
      if (position.dy - extraSpaceVerTop < 0) position = Offset(position.dx, extraSpaceVerTop);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    double spaceLeft = position.dx;
    double spaceRight = Sizes().screenWidth - spaceLeft;
    if (spaceLeft < spaceRight)
      _moveToLeftEdge();
    else
      _moveToRightEdge();
  }
}
