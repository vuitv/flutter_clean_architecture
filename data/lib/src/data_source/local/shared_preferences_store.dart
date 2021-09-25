import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/region_model.dart';

class SharedPrefsStore {
  static const String KEY_REGION = 'KEY_REGION';
  final SharedPreferences _prefs;

  SharedPrefsStore(this._prefs);

  Region? getRegion() {
    final jsonString = _prefs.getString(KEY_REGION);
    if (jsonString != null) {
      return RegionModel.fromJson(jsonDecode(jsonString));
    }
  }

  Future<bool> saveRegion(Region region) async {
    return await _prefs.setString(KEY_REGION, jsonEncode(region.toJson()));
  }
}
