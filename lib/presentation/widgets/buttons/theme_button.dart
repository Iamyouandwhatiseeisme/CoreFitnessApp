import 'package:core_fitness/data/enums.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  AppThemeMode _currentMode = AppThemeMode.system;

  void _toggleMode() {
    setState(() {
      _currentMode = AppThemeMode
          .values[(_currentMode.index + 1) % AppThemeMode.values.length];
    });
  }

  IconData _getIconForMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return Icons.desktop_windows;
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleMode,
      icon: Icon(_getIconForMode(_currentMode)),
    );
  }
}
