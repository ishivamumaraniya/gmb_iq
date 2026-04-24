import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isSelectable;

  const CustomText(
    this.text, {
    super.key,
    required this.fontSize,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.maxLines,
    this.isSelectable = false,
  });

  @override
  Widget build(BuildContext context) {
    // If no color is provided, we default to the textTheme's bodyMedium color 
    // which in your AppTheme is AppColors.textPrimary (or darkTextPrimary).
    final defaultColor = Theme.of(context).textTheme.bodyMedium?.color;

    final style = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? defaultColor,
    );

    if (isSelectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: style,
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }
}
