import 'package:flutter/material.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'desktop/home_desktop_view.dart';
import 'mobile_tablet/home_mobile_tablet_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: HomeDesktopView(),
      mobileTablet: HomeMobileTabletView(),
    );
  }
}
