import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_widget.dart';
import 'desktop/activity_desktop_view.dart';
import 'mobile_tablet/activity_mobile_tablet_view.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: ActivityDesktopView(),
      mobileTablet: ActivityMobileTabletView(),
    );
  }
}
