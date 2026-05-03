import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/widget/customAuthInfoBox.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_text.dart';

enum loadingRowStatus { initial, loading, success }

class ScanningGoogleAccountsScreen extends StatefulWidget {
  const ScanningGoogleAccountsScreen({super.key});

  @override
  State<ScanningGoogleAccountsScreen> createState() => _ScanningGoogleAccountsScreenState();
}

class _ScanningGoogleAccountsScreenState extends State<ScanningGoogleAccountsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _startProgress();
  }

  void _startProgress() {
    _progressController = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _progressController.forward();
    });

    _progressController.status.isCompleted;
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.pushNamed(AppRoutes.foundAccounts);
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose(); // Prevent memory leaks
    super.dispose();
  }

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
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildProgressSection(),
                    const SizedBox(height: 25),
                    _buildLoadingSection(),

                    const SizedBox(height: 25),
                    const Spacer(),
                    const SizedBox(height: 20),
                    _buildAuthInfo(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CustomImage(AppImages.googleLogo, width: 40.w, height: 40.h, fit: BoxFit.contain),
        const SizedBox(height: 15),
        const CustomText(
          "Scanning your\nGoogle account...",
          fontSize: 22,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          height: 1.15,
        ),
        const SizedBox(height: 5),
        const CustomText(
          "Looking for your google Business locations",
          fontSize: 14,
          textAlign: TextAlign.center,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        return CustomBorderContainer(
          myWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: CustomText("Scanning in progress", fontSize: 15, color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                  CustomText(
                    "${(_progressController.value * 100).toInt()}%",
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              LinearProgressIndicator(
                value: _progressController.value,
                backgroundColor: AppColors.primary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(10),
              ),
              const CustomText("This may take few moments", fontSize: 12, color: AppColors.textSecondary),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingSection() {
    return CustomBorderContainer(
      myWidget: Column(
        spacing: 15,
        children: [
          _myLoadingRowsWidget(
            title: "Connecting to Google",
            subtitle: "Secure connection established",
            status: loadingRowStatus.success,
            isLast: false,
          ),
          _myLoadingRowsWidget(
            title: "Finding business locations",
            subtitle: "Looking for your Google Business locations",
            status: loadingRowStatus.loading,
            isLast: false,
          ),
          _myLoadingRowsWidget(
            title: "Syncing location data",
            subtitle: "Preparing your locations",
            status: loadingRowStatus.initial,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthInfo() {
    return const CustomAuthInfoBox(
      image: AppImages.lockLogo,
      myColor: AppColors.primary,
      title: "Your data is safe and secure",
      subtitle: "We never share your information with third parties.",
    );
  }

  Widget _myLoadingRowsWidget({required String title, required String subtitle, required loadingRowStatus status, required bool isLast}) {
    final Color leftIconColor;
    final Color leftAvatarColor;
    final Widget leftIcon;
    final Widget rightIcon;

    switch (status) {
      case loadingRowStatus.success:
        leftIconColor = AppColors.primary;
        leftAvatarColor = AppColors.primary.withValues(alpha: .1);
        leftIcon = const Icon(Icons.check_circle_outline, color: AppColors.primary, size: 24);
        rightIcon = Icon(Icons.check, color: Theme.of(context).colorScheme.onSurface, size: 20);
        break;
      case loadingRowStatus.loading:
        leftIconColor = AppColors.primary;
        leftAvatarColor = AppColors.primary.withValues(alpha: .1);
        leftIcon = const Icon(Icons.autorenew, color: AppColors.primary, size: 24);
        rightIcon = Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
        );
        break;
      case loadingRowStatus.initial:
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
                    CustomText(subtitle, fontSize: 12, color: AppColors.textSecondary),
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
