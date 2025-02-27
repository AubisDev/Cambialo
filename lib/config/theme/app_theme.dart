import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(161, 229, 241, 1.0),
        brightness: Brightness.dark,
      );
}
