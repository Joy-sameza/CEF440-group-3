import 'package:flutter/material.dart';
import 'colors.dart';

final themeModeScheme = lightTheme();

ThemeData myTheme() {
  return ThemeData(
    primarySwatch: createMaterialColor(normal),
    colorScheme: themeModeScheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: normal, // Default button color
      textTheme: ButtonTextTheme.primary,
      splashColor: normal,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: normal,
      foregroundColor: light,
      elevation: 3,
      extendedSizeConstraints: BoxConstraints(
        maxWidth: 115,
        minWidth: 50,
        maxHeight: 50,
        minHeight: 50,
      ),
      extendedTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 60,
      indicatorColor: normal,
      backgroundColor: lightActive,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: normal),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: normal),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: normalHover),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}

ColorScheme lightTheme() {
  return const ColorScheme(
    primary: normal,
    primaryContainer: normalHover,
    secondary: dark,
    secondaryContainer: darkHover,
    surface: light,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    surfaceDim: darker,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}

/// Utility function to create a MaterialColor from a Color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
