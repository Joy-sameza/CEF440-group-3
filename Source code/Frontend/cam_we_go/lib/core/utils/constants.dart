import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../extensions.dart';

abstract final class Constants {}

final class Images implements Constants {
  static const String logo = 'assets/images/logo.png';
  static const String introductionImage =
      'assets/images/introduction_image.png';
}

final class ButtonSize implements Constants {
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

  static final Size _adaptiveIconSize = Size(2.8.w, 1.3.h);

  static buildSVG(String path) {
    return SvgPicture.asset(
      path,
      width: _adaptiveIconSize.width,
      height: _adaptiveIconSize.height,
      color: Colors.black,
    );
  }

  static Icon buildIcon(IconData iconData) {
    return Icon(iconData, size: 24, applyTextScaling: true);
  }
}

enum Gap { wide, narrow, normal }

enum InputType { password, text, number, email, report, phone }
