import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

final class AppIcons implements Constants {
  static const String _basePath = 'assets/icons/';
  static const String _extension = '.svg';
  // ignore: prefer_interpolation_to_compose_strings
  static const String pageControl = _basePath + 'page_control$_extension';
  // ignore: prefer_interpolation_to_compose_strings
  static const String distance = _basePath + 'distance$_extension';
  // ignore: prefer_interpolation_to_compose_strings
  static const String googleLogo = _basePath + 'google_logo$_extension';
  // ignore: prefer_interpolation_to_compose_strings
  static const String cameroonFlag = _basePath + 'cameroon$_extension';

  static SvgPicture buildSVG(String path) {
    return SvgPicture.asset(
      path,
      width: 24,
      height: 24,
      color: Colors.black,
    );
  }
}

enum Gap { wide, narrow, normal }

enum InputType { password, text, number, email, report, phone }
