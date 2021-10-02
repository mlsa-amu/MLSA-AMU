import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  //initOnStartUp
  static MediaQueryData mediaQuery = MediaQueryData();
  static bool isMobile = true;
  static double screenWidth = 0;
  static double screenHeight = 0;

  //orientation sensitive
  static double get safeBlockHorizontal =>
      (screenWidth - _safeAreaHorizontal) / 100;

  static double get safeBlockVertical =>
      (screenHeight - _safeAreaVertical) / 100;

  static double get baseFontSize =>
      _getFontSize(mediaQuery, _safeAreaHorizontal, _safeAreaVertical);

  static double get kDefaultPadding => isMobile ? 8 : 16;

  static double get kDefaultMargin => isMobile ? 8 : 16;

  static double get appBarHeight => isMobile ? kToolbarHeight : 90;

  static double get iconGeneralHeightAndWidth => isMobile ? 30 : 60;

  static double get _safeAreaHorizontal =>
      mediaQuery.padding.left + mediaQuery.padding.right;

  static double get _safeAreaVertical =>
      mediaQuery.padding.top + mediaQuery.padding.bottom;

  static void initOnStartUp(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    isMobile = screenWidth < 600 ? true : false;
  }
}

double _getFontSize(
    MediaQueryData mq, double safeAreaHorizontal, double safeAreaVertical) {
  if (mq.size.width > 600.0) {
    return ((mq.size.width / 1.5) - safeAreaHorizontal) / 100;
  }
  return (mq.size.width - safeAreaHorizontal) / 100;
}
