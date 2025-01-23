import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    if (screenSize.width < 600) {
      return mobile;
    } else if (screenSize.width >= 600 && screenSize.width < 950) {
      return tablet;
    } else {
      return desktop;
    }
  }
}