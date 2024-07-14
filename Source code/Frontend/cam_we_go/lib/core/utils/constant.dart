import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../extensions.dart';

abstract final class Constants {}

final class AppTokens implements Constants {
  static const String accessToken = 'accessToken';
  static final env = DotEnv(includePlatformEnvironment: true)..load();
}

final class Images implements Constants {
  static const String logo = 'assets/images/logo.png';

  static const String introductionImage ='assets/images/introduction_image.png';
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
  // ignore: prefer_interpolation_to_compose_strings
  static const String googleLogo = _basePath + 'google_logo$_extension';
  // ignore: prefer_interpolation_to_compose_strings
  static const String cameroonFlag = _basePath + 'cameroon$_extension';
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

final class AppUrls implements Constants {
  static final String serverUrl = AppTokens.env['SERVER_URL'] ?? '';
  static const String geocodingUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?address=';
  static const String reverseGeocodingUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=';
  static const String placesAPIUrl =
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query='; // https://places.googleapis.com/v1/places/GyuEmsRBfy61i59si0?fields=addressComponents&key=YOUR_API_KEY
  static final String mapsAPIKey = AppTokens.env['GOOGLE_MAPS_API_KEY'] ?? '';

  String geocode(String address) {
    return '$geocodingUrl$address&key=$mapsAPIKey';
  }

  String reverseGeocode(double latitude, double longitude) {
    return '$reverseGeocodingUrl$latitude,$longitude&key=$mapsAPIKey';
  }
}
