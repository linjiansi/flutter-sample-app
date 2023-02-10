import 'package:flutter/material.dart';
import 'package:flutter_sample_app/util/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends ChangeNotifier {
  late ThemeMode _themeMode;
  final SharedPreferences _pref;

  ThemeModeNotifier(this._pref) {
    _init();
  }

  ThemeMode get mode => _themeMode;

  void _init() async {
    _themeMode = await loadThemeMode(_pref);
    notifyListeners();
  }

  void update(ThemeMode nextMode) {
    _themeMode = nextMode;
    saveThemeMode(nextMode, _pref);
    notifyListeners();
  }
}
