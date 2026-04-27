import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 13,
    this.color,
    this.fontWeight = FontWeight.w500,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // padding: padding,
        // minimumSize: Size.zero,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
