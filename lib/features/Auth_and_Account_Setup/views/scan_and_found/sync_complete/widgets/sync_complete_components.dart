import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/router/app_router.dart';
import 'package:gmb_iq/core/storage/hive_setup.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

import '../../../../widget/customAuthInfoBox.dart';
import '../../found_accounts/found_accounts_state.dart';

class SyncCompleteComponents {
  static Widget buildHeader({CrossAxisAlignment alignment = CrossAxisAlignment.center}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.greenText.withValues(alpha: .1),
          child: const Icon(Icons.check_circle, color: AppColors.greenText, size: 33),
        ),
        const SizedBox(height: 15),
        const CustomText("Sync Complete!", fontSize: 24, fontWeight: FontWeight.w700),
        const SizedBox(height: 5),
        CustomText(
          "Your locations and reviews are${alignment == CrossAxisAlignment.center ? '\n' : ' '}now up to date.",
          fontSize: 14,
          isSecondary: true,
          textAlign: alignment == CrossAxisAlignment.center ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }

  static Widget buildLocationsList(BuildContext context, List<LocationData> syncedLocations) {
    return CustomBorderContainer(
      child: Column(
        children: syncedLocations.asMap().entries.map((entry) {
          final index = entry.key;
          final loc = entry.value;
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.isDarkMode ? AppColors.primary.withValues(alpha: 0.1) : const Color(0xFFE6EFFD),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const CustomImage(AppImages.locaitonLogo),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(loc.name, fontSize: 14, fontWeight: FontWeight.w500),
                        CustomText(loc.address, fontSize: 12, isSecondary: true),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Row(
                    children: [
                      CustomImage(AppImages.checkTickLogo),
                      SizedBox(width: 4),
                      CustomText("Synced", fontSize: 12, color: AppColors.greenText),
                    ],
                  ),
                ],
              ),
              if (index != syncedLocations.length - 1)
                const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Divider(height: 1)),
            ],
          );
        }).toList(),
      ),
    );
  }

  static Widget buildSecurityInfo() {
    return const CustomAuthInfoBox(
      image: AppImages.lockLogo,
      myColor: AppColors.greenText,
      wantSubtitleColor: true,
      title: "",
      subtitle: "All your review data is secure and up to date.",
    );
  }

  static Widget buildActionButtons(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          wantBorder: false,
          text: "Go to Dashboard",
          onPressed: () {
            HiveSetup.token = "Dummy";
            context.pushReplacementNamed(AppRoutes.home);
          },
          customIcon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
          alignment: IconAlignment.end,
        ),
      ],
    );
  }
}
