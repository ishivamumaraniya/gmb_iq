import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';

import '../theme/app_colors.dart';
import 'custom_text.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded, size: 100.sp, color: AppColors.primary.withValues(alpha: .2)),
            SizedBox(height: 40.h),
            const CustomText(
              "No Internet Connection",
              fontSize: 24,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            const CustomText(
              "Please check your internet connection and try again.",
              fontSize: 16,
              textAlign: TextAlign.center,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
