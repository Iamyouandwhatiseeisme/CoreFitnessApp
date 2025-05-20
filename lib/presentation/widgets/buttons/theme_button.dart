import 'package:core_fitness/bloc/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: themeProvider.toggleMode,
      icon: Icon(_getIconForMode(themeProvider.themeMode)),
    );
  }
}
