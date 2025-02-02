import 'package:flutter/material.dart';
import 'package:id_rumbuk_app/theme/custom_theme/bottom_navigation_bar_theme.dart';
import 'package:id_rumbuk_app/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:id_rumbuk_app/theme/custom_theme/elevated_button_theme.dart';
import 'package:id_rumbuk_app/theme/custom_theme/filled_button_theme.dart';
import 'package:id_rumbuk_app/theme/custom_theme/navigation_bar_theme.dart';
import 'package:id_rumbuk_app/theme/custom_theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
      surface: Colors.white,
      primary: const Color(0xffd78400),
      secondary: const Color(0xff394152),
    ),
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    filledButtonTheme: TFilledButtonTheme.lightFilledButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    navigationBarTheme: TNavigationBarTheme.lightBottomNavigationBarTheme,
    bottomNavigationBarTheme: TBottomNavigationBarTheme.lightBottomNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  );
}