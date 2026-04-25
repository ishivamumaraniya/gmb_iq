import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        debugPrint("Terms of Service tapped");
        // Navigation or URL launch logic here
      };
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        debugPrint("Privacy Policy tapped");
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
      title: "Insightful & Smart",
      description: "Manage all locations\nand reviews",
      color: AppColors.greenText,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ResponsiveWidget(mobileTablet: _mobileWidget(), desktop: _desktopWidget()),
    );
  }

  Widget _mobileWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight),
          // Passing size directly to the logo builder
          _buildLogo(width: 25.w, height: 25.h),
          const SizedBox(height: 40),
          _buildLoginForm(),
        ],
      ),
    );
  }

  Widget _desktopWidget() {
    return Row(
      children: [
        // Left side: Logo/Image
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: .15),
            child: Center(child: _buildLogo()),
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
        CustomImage(AppImages.loginLogo, height: 120.h, width: 200.w, fit: BoxFit.contain),
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
          onPressed: () {},
          customIcon: CustomImage(AppImages.googleLogo, height: 18.h, fit: BoxFit.contain),
        ),
        const SizedBox(height: 40),

        _infoLoginWidget(),
        const SizedBox(height: 40),
        _buildTermsAndPrivacy(),
      ],
    );
  }

  Widget _infoLoginWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(myInfoLoginList.length, (index) {
        final e = myInfoLoginList[index];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
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

                CustomText(
                  e.description,
                  fontSize: 11.5,
                  textAlign: TextAlign.center,
                  color: AppColors.textSecondary,
                  height: 1.1,
                ),
              ],
            ),
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

class myInfoLoginModel {
  final String svg;
  final String title;
  final String description;
  final Color color;

  myInfoLoginModel({required this.svg, required this.title, required this.description, required this.color});
}
