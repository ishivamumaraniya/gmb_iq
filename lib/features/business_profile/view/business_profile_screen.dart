import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_widget.dart';
import 'desktop/business_profile_desktop_view.dart';
import 'mobile_tablet/business_profile_mobile_tablet_view.dart';

class BusinessProfileScreen extends StatelessWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: BusinessProfileDesktopView(),
      mobileTablet: BusinessProfileMobileTabletView(),
    );
  }
}
