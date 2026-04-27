import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';

class CustomBorderContainer extends StatelessWidget {
  const CustomBorderContainer({super.key, required this.myWidget, this.padding = const EdgeInsets.all(13),  this.myColor,  this.wantBorder = true});

  final Widget myWidget;
  final EdgeInsets padding;
  final Color? myColor;
  final bool wantBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: padding,
      decoration: BoxDecoration(color: myColor,
        border: Border.all(color: wantBorder?AppColors.customBorderColorGrey:Colors.transparent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: myWidget,
    );
  }
}
