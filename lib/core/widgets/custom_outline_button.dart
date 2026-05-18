import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'custom_text.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CustomOutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: backgroundColor == null
                ? Border.all(color: borderColor ?? AppColors.buttonBorderColor)
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.primary,
          ),
        ),
      ),
    );
  }
}
