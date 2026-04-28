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
  final bool isDisable;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.customIcon,
    this.width = double.infinity,
    this.textColor = AppColors.textPrimary,
    this.alignment = IconAlignment.start,
    this.wantBorder = true,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Determine what the target color should be based on the current state.
    final Color targetColor = isDisable ? AppColors.lightGrey : backgroundColor ?? Theme.of(context).primaryColor;

    return Container(
      height: 50,
      width: width,
      constraints: const BoxConstraints(maxWidth: 400),
      // 2. Animate the background color change smoothly
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        tween: ColorTween(end: targetColor),
        builder: (context, animatedColor, child) {
          return ElevatedButton.icon(
            iconAlignment: alignment,
            icon: customIcon,
            style: ElevatedButton.styleFrom(
              overlayColor: Colors.transparent,
              backgroundColor: animatedColor, // Apply the smoothly changing color here
              disabledBackgroundColor: Colors.grey.shade300,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: wantBorder ? AppColors.buttonBorderColor : Colors.transparent, width: .5),
              ),
            ),
            onPressed: isDisable || isLoading ? null : onPressed,
            // 3. Smoothly cross-fade between the Text and the Loading Indicator
            label: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isLoading
                  ? const SizedBox(
                      key: ValueKey(
                        'loading_spinner',
                      ), // Keys are required for AnimatedSwitcher to know the widget changed
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 3),
                    )
                  : CustomText(
                      text,
                      key: const ValueKey('button_text'),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
            ),
          );
        },
      ),
    );
  }
}
