import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/widget/customAuthInfoBox.dart';
import '../../../../../core/constants/app_images.dart';

enum LoadingRowStatus { initial, loading, success }

class ScanningComponents {
  static Widget buildProgressSection(AnimationController progressController) {
    return AnimatedBuilder(
      animation: progressController,
      builder: (context, child) {
        return CustomBorderContainer(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: CustomText("Scanning in progress", fontSize: 15, color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                  CustomText(
                    "${(progressController.value * 100).toInt()}%",
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              LinearProgressIndicator(
                value: progressController.value,
                backgroundColor: AppColors.primary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(10),
              ),
              const CustomText("This may take a few moments", fontSize: 12, isSecondary: true),
            ],
          ),
        );
      },
    );
  }

  static Widget buildLoadingSection(BuildContext context) {
    return CustomBorderContainer(
      elevation: 2,
      child: Column(
        spacing: 15,
        children: [
          _myLoadingRowsWidget(
            context: context,
            title: "Connecting to Google",
            subtitle: "Secure connection established",
            status: LoadingRowStatus.success,
            isLast: false,
          ),
          _myLoadingRowsWidget(
            context: context,
            title: "Finding business locations",
            subtitle: "Looking for your Google Business locations",
            status: LoadingRowStatus.loading,
            isLast: false,
          ),
          _myLoadingRowsWidget(
            context: context,
            title: "Syncing location data",
            subtitle: "Preparing your locations",
            status: LoadingRowStatus.initial,
            isLast: true,
          ),
        ],
      ),
    );
  }

  static Widget buildAuthInfo() {
    return const CustomAuthInfoBox(
      image: AppImages.lockLogo,
      myColor: AppColors.primary,
      title: "Your data is safe and secure",
      subtitle: "We never share your information with third parties.",
    );
  }

  static Widget _myLoadingRowsWidget({
    required BuildContext context,
    required String title,
    required String subtitle,
    required LoadingRowStatus status,
    required bool isLast,
  }) {
    final Color leftIconColor;
    final Color leftAvatarColor;
    final Widget leftIcon;
    final Widget rightIcon;

    switch (status) {
      case LoadingRowStatus.success:
        leftIconColor = AppColors.primary;
        leftAvatarColor = AppColors.primary.withValues(alpha: .1);
        leftIcon = const Icon(Icons.check_circle_outline, color: AppColors.primary, size: 24);
        rightIcon = Icon(Icons.check, color: Theme.of(context).colorScheme.onSurface, size: 20);
        break;
      case LoadingRowStatus.loading:
        leftIconColor = AppColors.primary;
        leftAvatarColor = AppColors.primary.withValues(alpha: .1);
        leftIcon = const Icon(Icons.autorenew, color: AppColors.primary, size: 24);
        rightIcon = Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
        );
        break;
      case LoadingRowStatus.initial:
        leftIconColor = Colors.grey.shade400;
        leftAvatarColor = Colors.transparent;
        leftIcon = Icon(Icons.circle_outlined, color: leftIconColor, size: 24);
        rightIcon = Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(shape: BoxShape.circle, color: leftIconColor),
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 17.r, backgroundColor: leftAvatarColor, child: leftIcon),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(title, fontSize: 14, fontWeight: FontWeight.w600),
                    const SizedBox(height: 2),
                    CustomText(subtitle, fontSize: 12, isSecondary: true),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 4.0), child: rightIcon),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1),
      ],
    );
  }
}
