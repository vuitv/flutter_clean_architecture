import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  test('formatMoney', () {
    expect(Utils.formatMoney(100), '100₫');
    expect(Utils.formatMoney(1000), '1,000₫');
    expect(Utils.formatMoney(10000), '10,000₫');
    expect(Utils.formatMoney(100000), '100,000₫');
    expect(Utils.formatMoney(1000000), '1,000,000₫');

    expect(Utils.formatMoney(100.0), '100₫');
    expect(Utils.formatMoney(1000.1), '1,000₫');
    expect(Utils.formatMoney(10000.4), '10,000₫');
    expect(Utils.formatMoney(10000.55), '10,001₫');
    expect(Utils.formatMoney(100000.999), '100,001₫');
    expect(Utils.formatMoney(1000000.9999), '1,000,001₫');
  });

  test('daysBetween', () {
    expect(Utils.daysBetween(DateTime(2021), DateTime(2021, 1, 2)), 1);
    expect(Utils.daysBetween(DateTime(2021), DateTime(2021, 1, 3)), 2);
    expect(Utils.daysBetween(DateTime(2021, 1, 0), DateTime(2021)), 1);
    expect(Utils.daysBetween(DateTime(2021), DateTime(2021, 2)), 31);
    expect(Utils.daysBetween(DateTime(2021), DateTime(2021, 1, 1, 12)), 0);
    expect(Utils.daysBetween(DateTime(2021), DateTime(2021, 1, 1, 48)), 2);
  });

  test('hexColor', () {
    expect(Utils.hexColor('adfggn'), null);
    expect(Utils.hexColor('5ADFCBD'), null);
    expect(Utils.hexColor('ADFCBD'), Color(0xffADFCBD));
    expect(Utils.hexColor('ffadfcbd'), Color(0xffADFCBD));
  });

  test('parseJson', () {
    dynamic jsonNull = null;
    final json = {
      'aaa': 123,
    };
    expect(Utils.parseJson('', null), null);
    expect(Utils.parseJson('', jsonNull), null);
    expect(Utils.parseJson('', json), null);
    expect(Utils.parseJson('aaa', jsonNull), null);
    expect(Utils.parseJson('aaa', json), 123);
    expect(Utils.parseJson('bbb', json), null);
    expect(Utils.parseJson('', json, defaultValue: 0), 0);
    expect(Utils.parseJson('aaa', json, defaultValue: 0), 123);
    expect(Utils.parseJson('bbb', json, defaultValue: 0), 0);
  });

  test('parseJsonToInt', () {
    dynamic jsonNull = null;
    final json = {
      'aaa': 123,
      'bbb': 123.0,
      'ccc': '123',
      'ddd': '12a',
    };
    expect(Utils.parseJsonToInt('', null), null);
    expect(Utils.parseJsonToInt('', jsonNull), null);
    expect(Utils.parseJsonToInt('', json), null);
    expect(Utils.parseJsonToInt('a', json), null);
    expect(Utils.parseJsonToInt('aaa', jsonNull), null);
    expect(Utils.parseJsonToInt('aaa', json), 123);
    expect(Utils.parseJsonToInt('bbb', json), 123);
    expect(Utils.parseJsonToInt('ccc', json), 123);
    expect(Utils.parseJsonToInt('ddd', json), null);
  });

  test('parseJsonToDouble', () {
    dynamic jsonNull = null;
    final json = {
      'aaa': 123,
      'bbb': 123.0,
      'ccc': '123',
      'ddd': '12a',
    };
    expect(Utils.parseJsonToDouble('', null), null);
    expect(Utils.parseJsonToDouble('', jsonNull), null);
    expect(Utils.parseJsonToDouble('', json), null);
    expect(Utils.parseJsonToDouble('a', json), null);
    expect(Utils.parseJsonToDouble('aaa', jsonNull), null);
    expect(Utils.parseJsonToDouble('aaa', json), 123.0);
    expect(Utils.parseJsonToDouble('bbb', json), 123.0);
    expect(Utils.parseJsonToDouble('ccc', json), 123.0);
    expect(Utils.parseJsonToDouble('ddd', json), null);
  });
}
