import 'package:flutter/widgets.dart';

import 'language_vi.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages) ?? LanguageVi();
  }

  String get appName;

  String get home;

  String get coupon;

  String get shopping;

  String get newFeed;

  String get user;

  String get titleLocation;
}
