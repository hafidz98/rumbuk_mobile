import 'package:flutter/material.dart';

class TFilledButtonTheme {
  TFilledButtonTheme._();

  static final lightFilledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: 2,
      textStyle: const TextStyle().copyWith(fontSize: 24.0, letterSpacing: 0.5, fontWeight: FontWeight.w500),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );

  static final darkFilledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}
