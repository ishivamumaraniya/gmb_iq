import 'package:flutter/material.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context, 'Mobile/Tablet Splash'),
      desktop: _buildUI(context, 'Desktop Splash'),
    );
  }

  Widget _buildUI(BuildContext context, String text) {
    return CustomScaffold(body: Center(child: CustomImage(AppImages.appLogo)));
  }
}
