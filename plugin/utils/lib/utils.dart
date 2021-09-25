library utils;

import 'dart:ui';

import 'package:intl/intl.dart';

class Utils {
  static final _formatter = NumberFormat.currency(
    symbol: "₫",
    decimalDigits: 0,
    customPattern: "##,###,###¤",
  );

  static String formatMoney(num value) {
    return _formatter.format(value);
  }

  static int daysBetween(DateTime from, DateTime to) {
    try {
      final dFrom = DateTime(from.year, from.month, from.day);
      final dTo = DateTime(to.year, to.month, to.day);
      return (dTo.difference(dFrom).inHours / 24).round();
    } catch (e) {
      return 0;
    }
  }

  static Color? hexColor(String colorCode) {
    var color = colorCode.toUpperCase().replaceAll("#", "");
    if (color.length == 6) {
      color = "FF$color";
    }
    if (color.length == 8) {
      try {
        return Color(int.parse("0x$color"));
      } catch (_) {}
    }
    return null;
  }

  static T? parseJson<T>(String key, Map<String, dynamic>? json, {T? defaultValue}) {
    if (json == null) return defaultValue;
    try {
      return json.containsKey(key) && json[key] is T ? json[key] : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static int? parseJsonToInt(String key, Map<String, dynamic>? json) {
    if (json != null) {
      final value = parseJson(key, json);
      if (value is num) return value.toInt();
      if (value is String) return int.tryParse(value);
    }
  }

  static double? parseJsonToDouble(String key, Map<String, dynamic>? json) {
    if (json != null) {
      final value = parseJson(key, json);
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value);
    }
  }

  static List<T> parseJsonToList<T>(
    String key,
    Map<String, dynamic>? json,
    T Function(Map<String, dynamic>) factoryFunction,
  ) {
    if (json == null) return <T>[];
    final list = parseJson<List>(key, json) ?? <T>[];
    return listFromJson(list, factoryFunction);
  }

  static List<T> listFromJson<T>(List json, T Function(Map<String, dynamic>) factoryFunction) {
    final list = <T>[];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        final value = factoryFunction(element);
        list.add(value);
      }
    });
    return list;
  }
}
