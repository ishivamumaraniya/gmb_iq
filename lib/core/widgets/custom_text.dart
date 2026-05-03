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
  final double? height;
  final double? letterSpacing;
  final bool isSecondary;

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
    this.height,
    this.letterSpacing,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? defaultColor = Theme.of(context).textTheme.bodyMedium?.color;

    if (isSecondary) {
      defaultColor = Theme.of(context).colorScheme.onSurfaceVariant;
    }

    final style = GoogleFonts.googleSansFlex(
      letterSpacing: letterSpacing,
      fontSize: fontSize.spMin,
      fontWeight: fontWeight,
      color: color ?? defaultColor,
      height: height,
    );

    if (isSelectable) {
      return SelectableText(text, textAlign: textAlign, maxLines: maxLines, style: style);
    }

    return Text(text, textAlign: textAlign, maxLines: maxLines, overflow: overflow, style: style);
  }
}

class CustomTextSpan extends TextSpan {
  CustomTextSpan({
    required String super.text,
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
    super.recognizer,
    double? height,
    required BuildContext context,
  }) : super(
         style: GoogleFonts.googleSansFlex(
           fontSize: fontSize.spMin,
           color: Theme.of(context).colorScheme.onSurfaceVariant,
           fontWeight: fontWeight,
           height: height,
         ),
       );
}
