import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Widget? customIcon; // Could be an Image or Icon
  final double width;
  final Color textColor;
  final IconAlignment alignment;
  final bool wantBorder;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.customIcon,
    this.width = double.infinity,
    this.textColor = AppColors.textPrimary,
    this.alignment = IconAlignment.start,  this.wantBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton.icon(
        iconAlignment: alignment,
        icon: customIcon,
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.transparent,
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          disabledBackgroundColor: Colors.grey.shade300,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side:  BorderSide(color: wantBorder?AppColors.buttonBorderColor:Colors.transparent, width: .5),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        label: isLoading
            ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 3))
            : CustomText(text, fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
      ),
    );
  }
}
