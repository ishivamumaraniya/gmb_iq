import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

import '../../../core/widgets/custom_image.dart';

class CustomAuthInfoBox extends StatelessWidget {
  const CustomAuthInfoBox({
    super.key,
    required this.image,
    required this.myColor,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final Color myColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: myColor.withValues(alpha: .1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.scaffoldBackground,
            child: CustomImage(image, height: 23.h, fit: BoxFit.contain),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(title, fontSize: 15, color: AppColors.infoBoxTitleColor, fontWeight: FontWeight.w600),
                CustomText(subtitle, fontSize: 13, color: AppColors.infoBoxTitleColor),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ],
      ),
    );
  }
}
