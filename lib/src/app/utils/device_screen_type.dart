import 'package:flutter/widgets.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  final double deviceWidth = mediaQuery.size.shortestSide;
  final double desktopWidth = mediaQuery.size.width;

  //if (desktopWidth > 950) {
  if (desktopWidth > 992) {
    return DeviceScreenType.desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}

enum DeviceScreenType { mobile, tablet, desktop }
