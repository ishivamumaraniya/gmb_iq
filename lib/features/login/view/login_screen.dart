import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/responsive/responsive_widget.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ResponsiveWidget(mobileTablet: _mobileWidget(), desktop: _desktopWidget()),
    );
  }

  Widget _mobileWidget() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Passing size directly to the logo builder
            _buildLogo(width: 30.w, height: 30.h),
            SizedBox(height: 50.h),
            _buildLoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _desktopWidget() {
    return Row(
      children: [
        // Left side: Logo/Image
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Center(child: _buildLogo(width: 300, height: 300)),
          ),
        ),
        // Right side: Login Form
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450), // Prevent form from being too wide
                child: _buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo({double? width, double? height}) {
    return CustomImage(AppImages.appLogo, width: width, height: height, fit: BoxFit.contain);
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImage(AppImages.loginLogo, height: 140.h, fit: BoxFit.contain),
        SizedBox(height: 50.h),
        CustomText("Let's get started", fontSize: 30, fontWeight: FontWeight.w500),
        SizedBox(height: 10.h),
        CustomText(
          "Connect your Google Business Profile\nto manage reviews, responses,\nand insights —all in one place.",
          fontSize: 18,
          textAlign: TextAlign.center,
          color: AppColors.darkTextSecondary,
        ),
      ],
    );
  }
}
