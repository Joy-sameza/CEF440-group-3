import 'package:flutter/material.dart';

abstract class Constants {}

class Images implements Constants {
  static const String logo = 'assets/images/logo.png';
  static const String introductionImage = 'assets/images/introduction_image.png';
}
class ButtonSize implements Constants{
  static const Size large = Size(309, 45);
  static const Size medium = Size(283, 45);
  static const Size small = Size(143, 45);
}

enum Gap {wide, narrow, normal}
enum InputType {password, text, number, email, report, phone}