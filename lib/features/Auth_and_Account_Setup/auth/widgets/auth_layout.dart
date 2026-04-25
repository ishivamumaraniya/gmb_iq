import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/responsive/responsive_widget.dart';
import '../../../../core/widgets/custom_image.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      // On Mobile/Tablet, just show the content full screen
      mobileTablet: child,

      // On Desktop, show the static logo on the left and sliding child on the right
      desktop: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const Center(child: CustomImage(AppImages.appLogo, width: 300, height: 300, fit: BoxFit.contain)),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
