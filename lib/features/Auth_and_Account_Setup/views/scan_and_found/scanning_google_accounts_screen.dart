import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/widget/customAuthInfoBox.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_text.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            CustomImage(AppImages.googleLogo, width: 50.w, height: 50.h, fit: BoxFit.contain),
            const SizedBox(height: 25),
            const CustomText(
              "Scanning your\nGoogle account...",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),

            const CustomText(
              "Looking for your google Business locations",
              fontSize: 16,
              textAlign: TextAlign.center,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 20),

            const Spacer(),
            const CustomAuthInfoBox(
              image: AppImages.lockLogo,
              myColor: AppColors.primary,
              title: "Your data is safe and secure",
              subtitle: "We never share your information with third parties.",
            ),
          ],
        ),
      ),
    );
  }
}
