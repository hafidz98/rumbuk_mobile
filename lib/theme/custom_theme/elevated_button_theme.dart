import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme =
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      ));

  static final darkElevatedButtonTheme =
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom());
}
