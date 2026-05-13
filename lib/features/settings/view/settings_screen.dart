import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_widget.dart';
import 'desktop/settings_desktop_view.dart';
import 'mobile_tablet/settings_mobile_tablet_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: SettingsDesktopView(),
      mobileTablet: SettingsMobileTabletView(),
    );
  }
}
