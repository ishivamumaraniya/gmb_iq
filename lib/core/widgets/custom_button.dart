import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

import 'CustomBorderContainers.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Widget? customIcon; // Could be an Image or Icon
  final double width;
  final Color? textColor;
  final IconAlignment alignment;
  final bool wantBorder;
  final bool isDisable;
  final double maxWidth;
  final bool isSecondary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.customIcon,
    this.width = double.infinity,
    this.textColor,
    this.alignment = IconAlignment.start,
    this.wantBorder = true,
    this.isDisable = false,
    this.maxWidth = 500,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine target background color
    final Color targetBgColor = isDisable
        ? AppColors.lightGrey
        : (isSecondary ? Theme.of(context).scaffoldBackgroundColor : (backgroundColor ?? Theme.of(context).primaryColor));

    // Determine target text/icon color
    final Color effectiveTextColor = isSecondary ? (textColor ?? Theme.of(context).colorScheme.onSurface) : Colors.white;

    return Container(
      height: 50,
      width: width,
      constraints: BoxConstraints(maxWidth: maxWidth),
      // 2. Animate the background color change smoothly
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        tween: ColorTween(end: targetBgColor),
        builder: (context, animatedBgColor, child) {
          return ElevatedButton.icon(
            iconAlignment: alignment,
            icon: customIcon,
            style: ElevatedButton.styleFrom(
              overlayColor: Colors.transparent,
              backgroundColor: animatedBgColor,
              foregroundColor: effectiveTextColor,
              // This automatically tints Icons inside the button
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
                      key: ValueKey('loading_spinner'),
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 3),
                    )
                  : CustomText(text, fontSize: 15, fontWeight: FontWeight.w500, color: effectiveTextColor),
            ),
          );
        },
      ),
    );
  }
}

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomBorderContainer(
      padding: EdgeInsets.zero,
      wantBorder: false,
      child: (GoogleSignInPlatform.instance as web.GoogleSignInPlugin).renderButton(
        configuration: web.GSIButtonConfiguration(
          type: web.GSIButtonType.standard,
          theme: Theme.of(context).brightness == Brightness.dark ? web.GSIButtonTheme.filledBlack : web.GSIButtonTheme.outline,
          size: web.GSIButtonSize.large,
          text: web.GSIButtonText.continueWith,
          shape: web.GSIButtonShape.pill,
          minimumWidth: width ?? 500,
        ),
      ),
    );
  }
}
