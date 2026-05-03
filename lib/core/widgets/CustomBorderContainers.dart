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
    this.borderRadius = 5,
    this.boxShadow,
    this.elevation = 0,
  });

  final Widget myWidget;
  final EdgeInsets padding;
  final Color? myColor;
  final bool wantBorder;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final resolvedColor = myColor ?? Theme.of(context).scaffoldBackgroundColor;

    final resolvedBorderColor = wantBorder ? (isDark ? AppColors.darkBorderColor : AppColors.customBorderColorGrey) : Colors.transparent;

    return PhysicalModel(
      borderRadius: BorderRadius.circular(borderRadius),
      color: resolvedColor,
      elevation: elevation,
      child: Container(
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: padding,
        decoration: BoxDecoration(
          color: resolvedColor,
          border: Border.all(color: resolvedBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        child: myWidget,
      ),
    );
  }
}
