import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.logoSize = 45, this.textSize = 40});

  final double logoSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(AppImages.logoGraphLogo, height: logoSize, width: logoSize),
        CustomText("GmblQ", fontSize: textSize, fontWeight: FontWeight.bold, letterSpacing: -1),
      ],
    );
  }
}
