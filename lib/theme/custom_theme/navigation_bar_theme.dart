import 'package:flutter/material.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData lightBottomNavigationBarTheme =
      const NavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 1,
    iconTheme: WidgetStatePropertyAll(IconThemeData(
      color: Colors.black
    )),
  );
}
