import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/widgets/custom_image.dart';

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
              color: AppColors.lightPrimaryColor,
              child: Center(
                child: CustomImage(AppImages.appLogo, width: 40.w, height: 40.h, fit: BoxFit.contain),
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 500), child: child),
          ),
        ],
      ),
    );
  }
}
