import 'package:flutter/material.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';

import '../constants/app_images.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.logoSize = 45, this.textSize = 35});

  final double logoSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(AppImages.logoGraphLogo, height: logoSize, width: logoSize, fit: BoxFit.contain),
        SizedBox(width: !context.isDesktop ? 0 : 10),
        CustomText("GmblQ", fontSize: textSize, fontWeight: FontWeight.bold, letterSpacing: -1),
      ],
    );
  }
}
