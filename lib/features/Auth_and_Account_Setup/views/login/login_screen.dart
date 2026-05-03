import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_widget.dart';
import 'login_desktop_view.dart';
import 'login_mobile_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobileTablet: LoginMobileView(),
      desktop: LoginDesktopView(),
    );
  }
}
