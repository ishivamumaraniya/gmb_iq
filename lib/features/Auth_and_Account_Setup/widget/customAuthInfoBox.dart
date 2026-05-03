import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

import '../../../core/widgets/custom_image.dart';

class CustomAuthInfoBox extends StatelessWidget {
  const CustomAuthInfoBox({
    super.key,
    required this.image,
    required this.myColor,
    required this.title,
    required this.subtitle,
    this.wantSubtitleColor = false,
  });

  final String image;
  final Color myColor;
  final String title;
  final String subtitle;
  final bool wantSubtitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: myColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: myColor.withValues(alpha: .2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: CustomImage(image, height: 23.h, fit: BoxFit.contain, color: myColor),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty) CustomText(title, fontSize: 15, isSecondary: true, fontWeight: FontWeight.w600),
                if (subtitle.isNotEmpty) CustomText(subtitle, fontSize: 13, color: wantSubtitleColor ? myColor : null, isSecondary: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
