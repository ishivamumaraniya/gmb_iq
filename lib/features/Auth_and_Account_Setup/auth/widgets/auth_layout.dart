import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/responsive/responsive_widget.dart';
import '../../../../core/widgets/custom_image.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: child,
      desktop: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: .1),
              child: Center(
                child: CustomImage(AppImages.appLogo, width: 100.w, height: 100.h, fit: BoxFit.contain),
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
