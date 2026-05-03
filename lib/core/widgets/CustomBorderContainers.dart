import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';

class CustomBorderContainer extends StatelessWidget {
  const CustomBorderContainer({
    super.key,
    required this.myWidget,
    this.padding = const EdgeInsets.all(13),
    this.myColor,
    this.wantBorder = true,
  });

  final Widget myWidget;
  final EdgeInsets padding;
  final Color? myColor;
  final bool wantBorder;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final resolvedColor = myColor ?? Theme.of(context).scaffoldBackgroundColor;

    final resolvedBorderColor = wantBorder ? (isDark ? AppColors.darkBorderColor : AppColors.customBorderColorGrey) : Colors.transparent;

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: padding,
      decoration: BoxDecoration(
        color: resolvedColor,
        border: Border.all(color: resolvedBorderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: myWidget,
    );
  }
}
