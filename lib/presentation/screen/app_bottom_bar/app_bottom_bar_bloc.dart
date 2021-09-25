import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomBarIndex {
  home,
  coupon,
  shopping,
  newFeed,
  user,
}

class AppBottomBarBloc extends BlocBase<BottomBarIndex> {
  AppBottomBarBloc() : super(BottomBarIndex.home);

  BottomBarIndex get currentIndex => state;

  void changeTab(BottomBarIndex index) {
    emit(index);
  }
}
