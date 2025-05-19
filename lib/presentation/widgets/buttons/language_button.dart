import 'package:core_fitness/data/enums/language_mode.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  LanguageMode _currentMode = LanguageMode.english;
  void _toggleMode() {
    setState(() {
      _currentMode = LanguageMode
          .values[(_currentMode.index + 1) % LanguageMode.values.length];
    });
  }

  Flag _getLanguageIconData({required LanguageMode mode}) {
    switch (mode) {
      case LanguageMode.english:
        return Flag.fromCode(FlagsCode.US, width: 40, height: 40);

      case LanguageMode.georgian:
        return Flag.fromCode(FlagsCode.GE, width: 40, height: 40);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMode,
      child: ClipOval(child: _getLanguageIconData(mode: _currentMode)),
    );
  }
}
