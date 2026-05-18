import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final Widget? customIcon;
  final IconAlignment alignment;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 13,
    this.color,
    this.fontWeight = FontWeight.w500,
    this.padding = EdgeInsets.zero,
    this.customIcon,
    this.alignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    if (customIcon != null) {
      return TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        icon: customIcon!,
        label: CustomText(
          text,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
        iconAlignment: alignment,
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      child: CustomText(
        text,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
