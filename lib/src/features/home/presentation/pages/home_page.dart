import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/common/widgets/responsive_widget.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/desktop/menu_desktop_page.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/mobile/menu_mobile_page.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/tablet/menu_tablet_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(desktop: MenuDesktopPage(), tablet: MenuTabletPage(), mobile: MenuMobilePage());
  }
}
