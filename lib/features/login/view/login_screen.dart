import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/responsive/responsive_widget.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<myInfoLoginModel> myInfoLoginList = [
    myInfoLoginModel(svg: svg, title: "Secure & Private", description: "Your data is always protected", color: AppColors.primary),
    myInfoLoginModel(svg: svg, title: "Quick & Easy", description: "Connect in seconds and get started", color: AppColors.darkPink),
    myInfoLoginModel(svg: svg, title: "Secure & Private", description: "Manage all locations and reviews", color: AppColors.greenText),
  ];

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
            _buildLogo(width: 25.w, height: 25.h),
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
        CustomImage(AppImages.loginLogo, height: 120.h, fit: BoxFit.contain),
        SizedBox(height: 40.h),
        CustomText("Let's get started", fontSize: 27, fontWeight: FontWeight.w500),
        SizedBox(height: 5.h),
        CustomText(
          height: 1.25,
          "Connect your Google Business Profile\nto manage reviews, responses,\nand insights — all in one place.",
          fontSize: 16,
          textAlign: TextAlign.center,
          color: AppColors.textSecondary,
        ),
        SizedBox(height: 40.h),
        CustomButton(
          text: "Continue With Google",
          backgroundColor: AppColors.scaffoldBackground,
          onPressed: () {},
          customIcon: CustomImage(AppImages.googleLogo),
        ),

        _infoLoginWidget(),
      ],
    );
  }

  Widget _infoLoginWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: myInfoLoginList.map((e) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(e.svg, height: 40.h, width: 40.w, fit: BoxFit.contain),
                SizedBox(height: 12.h),

                CustomText(e.title, fontSize: 16, fontWeight: FontWeight.w600, textAlign: TextAlign.center),

                SizedBox(height: 6.h),

                CustomText(e.description, fontSize: 13, textAlign: TextAlign.center, color: AppColors.textSecondary, height: 1.4),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class myInfoLoginModel {
  final String svg;
  final String title;
  final String description;
  final Color color;

  myInfoLoginModel({required this.svg, required this.title, required this.description, required this.color});
}
