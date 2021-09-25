import 'package:flutter/widgets.dart';

import 'language_vi.dart';
import 'languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate._();

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate._();

  static const List<Locale> supportedLocales = const <Locale>[
    const Locale('vi', ''),
  ];

  @override
  bool isSupported(Locale locale) => [
        'vi',
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'vi':
        return LanguageVi();
      default:
        return LanguageVi();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
