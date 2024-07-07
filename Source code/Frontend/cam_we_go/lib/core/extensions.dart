import 'dart:ui';

import 'package:flutter/material.dart';

import 'utils/constants.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get surfaceDim => colorScheme.surfaceDim;
  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get screenHeightWithoutStatusBar =>
      screenHeight - mediaQuery.padding.top;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
}

extension AdaptiveExt on num {
  double get h =>
      this <= 100 && this >= 0 ? this * _Adaptive.height / 100 : toDouble();
  double get w =>
      this <= 100 && this >= 0 ? this * _Adaptive.width / 100 : toDouble();
  double get dp => this * _Adaptive.devicePixelRatio;
}

class _Adaptive {
  static double width = window.physicalSize.width;
  static double height = window.physicalSize.height;
  static double devicePixelRatio = window.devicePixelRatio;
}

extension GapSize on Gap {
  double get normal => 10;
  double get narrow => 5;
  double get wide => 15;
}

extension StringExtension on String {
  String get capitalized {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}