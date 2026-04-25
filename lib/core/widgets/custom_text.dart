import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isSelectable;
  final double? height; // Added to control line spacing

  const CustomText(
    this.text, {
    super.key,
    required this.fontSize,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.isSelectable = false,
    this.height, // Added optional parameter
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).textTheme.bodyMedium?.color;

    final style = GoogleFonts.googleSansFlex(
      fontSize: fontSize.spMin,
      fontWeight: fontWeight,
      color: color ?? defaultColor,
      height: height, // Passes line height multiplier to TextStyle
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
