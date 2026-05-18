import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theme/app_colors.dart';
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
                child: CustomImage(e.svg, height: (index == 2 ? 19 : 23), fit: BoxFit.contain),
              ),
              const SizedBox(height: 7),
              CustomText(e.title, fontSize: 13, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
              const SizedBox(height: 1),
              CustomText(e.description, fontSize: 11.5, textAlign: TextAlign.center, isSecondary: true, height: 1.1),
            ],
          ),
        );
      }),
    );
  }

  static Widget buildTermsAndPrivacy(BuildContext context) {
    List<Widget> termAndPrivacy = [
      const CustomText("By continuing, you agree to our ", fontSize: 13, isSecondary: true),

      if (!context.isDesktop) ...[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const CustomText("Terms of Service", fontSize: 13, color: AppColors.primary),
            ),
            const CustomText(" and ", fontSize: 13, isSecondary: true),
            InkWell(
              onTap: () {},
              child: const CustomText("Privacy Policy.", fontSize: 13, color: AppColors.primary),
            ),
          ],
        ),
      ] else ...[
        InkWell(
          onTap: () {},
          child: const CustomText("Terms of Service", fontSize: 13, color: AppColors.primary),
        ),
        const CustomText(" and ", fontSize: 13, isSecondary: true),
        InkWell(
          onTap: () {},
          child: const CustomText("Privacy Policy.", fontSize: 13, color: AppColors.primary),
        ),
      ],
    ];

    return context.isDesktop
        ? Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: termAndPrivacy)
        : Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: termAndPrivacy);
  }
}
