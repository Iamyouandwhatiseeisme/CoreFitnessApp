import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleMode() {
    _themeMode = _themeMode == ThemeMode.system
        ? ThemeMode.light
        : _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.system;
    notifyListeners();
  }
}
