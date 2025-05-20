import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  ThemeMode _currentMode = ThemeMode.system;

  void _toggleMode() {
    setState(() {
      _currentMode =
          ThemeMode.values[(_currentMode.index + 1) % ThemeMode.values.length];
    });
  }

  IconData _getIconForMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.desktop_windows;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
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
