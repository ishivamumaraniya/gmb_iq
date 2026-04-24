import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final int? maxLines;

  const CustomText(
    this.text, {
    super.key,
    required this.fontSize,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    // If no color is provided, we default to the textTheme's bodyMedium color 
    // which in your AppTheme is AppColors.textPrimary (or darkTextPrimary).
    final defaultColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? defaultColor,
      ),
    );
  }
}
