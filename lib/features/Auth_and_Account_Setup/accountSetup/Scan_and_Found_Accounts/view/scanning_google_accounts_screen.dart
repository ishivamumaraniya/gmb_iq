import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/custom_text.dart';

class ScanningGoogleAccountsScreen extends StatefulWidget {
  const ScanningGoogleAccountsScreen({super.key});

  @override
  State<ScanningGoogleAccountsScreen> createState() => _ScanningGoogleAccountsScreenState();
}

class _ScanningGoogleAccountsScreenState extends State<ScanningGoogleAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Show logo at the top ONLY on Mobile/Tablet
                if (!context.isDesktop) ...[
                  CustomImage(AppImages.appLogo, width: 25.w, height: 25.h, fit: BoxFit.contain),
                  const SizedBox(height: 40),
                ],
                const CustomText(
                  "Scanning for Accounts...",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
