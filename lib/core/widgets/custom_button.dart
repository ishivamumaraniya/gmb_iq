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

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.customIcon,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: width,
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton.icon(
        icon: customIcon,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          disabledBackgroundColor: Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: .5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: AppColors.buttonBorderColor, width: 1.2),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        label: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 3),
              )
            : CustomText(text, fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
