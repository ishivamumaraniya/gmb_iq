import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileTablet;
  final Widget desktop;

  const ResponsiveWidget({super.key, required this.mobileTablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1040) {
          return desktop;
        } else {
          return mobileTablet;
        }
      },
    );
  }
}
