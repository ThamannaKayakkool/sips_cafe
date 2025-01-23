import 'package:flutter/material.dart';

class Device {
  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 950;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600 &&
        MediaQuery.sizeOf(context).width < 950;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }
}
