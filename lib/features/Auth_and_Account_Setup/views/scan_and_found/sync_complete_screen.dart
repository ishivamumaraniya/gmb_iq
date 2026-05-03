import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import '../../widget/customAuthInfoBox.dart';
import 'found_google_accounts_screen.dart';

class SyncCompleteScreen extends StatelessWidget {
  final List<LocationData> syncedLocations;

  const SyncCompleteScreen({super.key, required this.syncedLocations});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      maxWidth: 500,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.greenText.withValues(alpha: .1),
                      child: const Icon(Icons.check_circle, color: AppColors.greenText, size: 33),
                    ),
                    const SizedBox(height: 10),
                    const CustomText("Sync Complete!", fontSize: 20, fontWeight: FontWeight.w600),
                    const SizedBox(height: 5),
                    const CustomText(
                      "Your locations and reviews are\nnow up to date.",
                      fontSize: 14,
                      isSecondary: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    CustomBorderContainer(
                      myWidget: Column(
                        children: syncedLocations.asMap().entries.map((entry) {
                          final index = entry.key;
                          final loc = entry.value;
                          return Column(
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: context.isDarkMode ? AppColors.primary.withValues(alpha: 0.1) : const Color(0xFFE6EFFD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const CustomImage(AppImages.locaitonLogo),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(loc.name, fontSize: 14, fontWeight: FontWeight.w500),
                                        CustomText(loc.address, fontSize: 12, isSecondary: true),
                                      ],
                                    ),
                                  ),
                                  const Row(
                                    spacing: 4,
                                    children: [
                                      CustomImage(AppImages.checkTickLogo),
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
                    ),
                    const SizedBox(height: 20),
                    const CustomAuthInfoBox(
                      image: AppImages.lockLogo,
                      myColor: AppColors.greenText,
                      wantSubtitleColor: true,
                      title: "",
                      subtitle: "All your review data is secure and up to date.",
                    ),
                    const Spacer(),
                    const SizedBox(height: 20),
                    CustomButton(
                      wantBorder: false,
                      text: "Go to Dashboard",
                      onPressed: () {},
                      textColor: AppColors.scaffoldBackground,
                      customIcon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                      alignment: IconAlignment.end,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      isSecondary: true,
                      text: "Connect Another Google Account",
                      onPressed: () {},
                      textColor: AppColors.primary,
                      customIcon: const CustomImage(AppImages.googleLogo),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
