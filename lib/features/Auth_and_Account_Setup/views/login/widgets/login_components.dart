import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../model/login_info_mode;.dart';

class LoginComponents {
  static final List<myInfoLoginModel> myInfoLoginList = [
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

  static Widget buildInfoLoginWidget(BuildContext context) {
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

  static Widget buildTermsAndPrivacy() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const CustomText("By continuing, you agree to our ", fontSize: 13, color: AppColors.textSecondary),
        InkWell(
          onTap: () {},
          child: const CustomText("Terms of Service", fontSize: 13, color: AppColors.primary),
        ),
        const CustomText(" and ", fontSize: 13, color: AppColors.textSecondary),
        InkWell(
          onTap: () {},
          child: const CustomText("Privacy Policy.", fontSize: 13, color: AppColors.primary),
        ),
      ],
    );
  }

  static Widget buildGoogleButton(BuildContext context) {
    return CustomButton(
      isSecondary: true,
      text: "Continue With Google",
      backgroundColor: AppColors.scaffoldBackground,
      onPressed: () {
        context.pushNamed(AppRoutes.scanningAccounts);
      },
      customIcon: CustomImage(AppImages.googleLogo, height: 18.h, fit: BoxFit.contain),
    );
  }
}
