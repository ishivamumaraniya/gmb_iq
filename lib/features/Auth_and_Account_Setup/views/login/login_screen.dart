import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';
import 'package:gmb_iq/core/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../model/login_info_mode;.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigation or URL launch logic here
      };
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigation or URL launch logic here
      };
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  List<myInfoLoginModel> myInfoLoginList = [
    myInfoLoginModel(
      svg: AppImages.lockLogo,
      title: "Secure & Private",
      description: "Your data is always\nprotected",
      color: AppColors.primary,
    ),
    myInfoLoginModel(
      svg: AppImages.boltLogo,
      title: "Quick & Easy",
      description: "Connect in seconds\nand get started",
      color: AppColors.darkPink,
    ),
    myInfoLoginModel(
      svg: AppImages.graphLogo,
      title: "Bright & Insight",
      description: "Manage all locations\nand reviews",
      color: AppColors.greenText,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      maxWidth: 500,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!context.isDesktop) ...[
                      CustomImage(
                        AppImages.appLogo,
                        width: (context.isMobile ? 25 : 20).w,
                        height: (context.isMobile ? 25 : 20).h,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),
                    ],
                    _buildLoginFormContent(context),
                    const Spacer(),
                    const SizedBox(height: 20),
                    _buildTermsAndPrivacy(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginFormContent(BuildContext context) {
    final double logoHeight = context.isMobile ? 150.h : (context.isTablet ? 90.h : 130.h);
    final double logoWidth = context.isMobile ? 200.w : (context.isTablet ? 100.w : 180.w);

    return Column(
      children: [
        Container(
          color: Colors.white,
          child: CustomImage(AppImages.loginLogo, height: logoHeight, width: logoWidth, fit: BoxFit.contain),
        ),
        const SizedBox(height: 40),
        const CustomText("Let's get started", fontSize: 26, fontWeight: FontWeight.w500),
        const SizedBox(height: 5),
        const CustomText(
          height: 1.25,
          "Connect your Google Business Profile\nto manage reviews, responses,\nand insights — all in one place.",
          fontSize: 15,
          textAlign: TextAlign.center,
          color: AppColors.textSecondary,
        ),
        const SizedBox(height: 35),
        CustomButton(
          text: "Continue With Google",
          backgroundColor: AppColors.scaffoldBackground,
          onPressed: () {
            context.pushNamed(AppRoutes.scanningAccounts);
          },
          customIcon: CustomImage(AppImages.googleLogo, height: 18.h, fit: BoxFit.contain),
        ),
        const SizedBox(height: 40),
        _infoLoginWidget(context),
      ],
    );
  }

  Widget _infoLoginWidget(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(myInfoLoginList.length, (index) {
        final e = myInfoLoginList[index];
        return Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: e.color.withValues(alpha: .15),
                child: CustomImage(e.svg, height: (index == 2 ? 19 : 23).h, fit: BoxFit.contain),
              ),
              SizedBox(height: 7.h),
              CustomText(e.title, fontSize: 13, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
              SizedBox(height: 1.h),
              CustomText(e.description, fontSize: 11.5, textAlign: TextAlign.center, color: AppColors.textSecondary, height: 1.1),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTermsAndPrivacy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.googleSansFlex(color: AppColors.textSecondary, height: 1.5, fontSize: 13.spMin),
        children: [
          const TextSpan(text: "By continuing, you agree to our\n"),
          CustomTextSpan(
            text: "Terms of Service ",
            fontSize: 13,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            recognizer: _termsRecognizer,
          ),
          CustomTextSpan(text: " and ", fontSize: 13),
          CustomTextSpan(
            text: "Privacy Policy.",
            fontSize: 13,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            recognizer: _privacyRecognizer,
          ),
        ],
      ),
    );
  }
}
