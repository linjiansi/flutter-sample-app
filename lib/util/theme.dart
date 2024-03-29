import 'package:flutter/material.dart';
import 'package:flutter_sample_app/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

int modeToVal(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.system:
      return 1;
    case ThemeMode.dark:
      return 2;
    case ThemeMode.light:
      return 3;
    default:
      return 0;
  }
}

ThemeMode valToMode(int val) {
  switch (val) {
    case 1:
      return ThemeMode.system;
    case 2:
      return ThemeMode.dark;
    case 3:
      return ThemeMode.light;
    default:
      return ThemeMode.system;
  }
}

Future<void> saveThemeMode(ThemeMode mode, SharedPreferences pref) async {
  pref.setInt(themeMode, modeToVal(mode));
}

Future<ThemeMode> loadThemeMode(SharedPreferences pref) async {
  final ret = valToMode(pref.getInt(themeMode) ?? 0);
  return ret;
}
