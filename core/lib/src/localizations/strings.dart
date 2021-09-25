import 'package:flutter/widgets.dart';

import 'languages.dart';

class Strings {
  static late BuildContext _context;

  static init(BuildContext context) {
    _context = context;
  }

  static Languages get tr => Languages.of(_context);
}
