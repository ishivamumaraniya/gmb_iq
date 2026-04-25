import 'package:flutter/material.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/router/app_router.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateFunc();

  }
  void _navigateFunc()async{
    await Future.delayed(const Duration(seconds: 3),() {
      context.goNamed(AppRoutes.login);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context, 'Mobile/Tablet Splash'),
      desktop: _buildUI(context, 'Desktop Splash'),
    );
  }

  Widget _buildUI(BuildContext context, String text) {
    return const CustomScaffold(body: Center(child: CustomImage(AppImages.appLogo)));
  }
}
