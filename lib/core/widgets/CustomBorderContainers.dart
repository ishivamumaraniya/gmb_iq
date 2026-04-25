import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';

class CustomBorderContainer extends StatelessWidget {
  const CustomBorderContainer({super.key, required this.myWidget, this.padding = const EdgeInsets.all(13)});

  final Widget myWidget;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),

      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.customBorderColorGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: myWidget,
    );
  }
}
