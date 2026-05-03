import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/theme_extensions.dart';
import '../../../../../../core/widgets/custom_checkbox.dart';
import '../../../../../../core/widgets/custom_text_button.dart';
import '../../../../../../core/widgets/sync_location_progress.dart';
import '../../../../../../core/router/app_router.dart';
import '../found_accounts_state.dart';

class FoundAccountsComponents {
  static Widget buildHeader(BuildContext context, {CrossAxisAlignment alignment = CrossAxisAlignment.center}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.greenText.withValues(alpha: .1),
          child: const Icon(Icons.check_circle, color: AppColors.greenText, size: 33),
        ),
        const SizedBox(height: 15),
        CustomText(
          "Success! We found 5 locations",
          fontSize: context.isDesktop ? 32 : 16,
          fontWeight: context.isDesktop ? FontWeight.w700 : FontWeight.w500,
        ),
        CustomText("on your Google Account", fontSize: context.isDesktop ? 16 : 14, isSecondary: true),
      ],
    );
  }

  static Widget buildConnectedAccount(FoundAccountsState state) {
    return CustomBorderContainer(
      borderRadius: 10,
      elevation: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.primary.withValues(alpha: .1),
            child: const CustomText("W", fontSize: 20, color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText("Connected as", fontSize: 12, isSecondary: true),
                CustomText("wadewarren@gmail.com", fontSize: 14, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          CustomTextButton(text: "Change", onPressed: state.onChangeAccount, color: AppColors.primary),
        ],
      ),
    );
  }

  static Widget buildLocationsListHeader(BuildContext context, FoundAccountsState state) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                CustomTextSpan(
                  text: "Locations found ",
                  fontSize: 13,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w500,
                  context: context,
                ),
                CustomTextSpan(text: "(${state.locations.length})", fontSize: 13, context: context),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const CustomText("Select all", fontSize: 13, color: AppColors.primary),
            const SizedBox(width: 8),
            CustomCheckbox(value: state.selectedCount == state.locations.length, onChanged: state.onSelectAll),
          ],
        ),
      ],
    );
  }

  static Widget buildLocationsList(FoundAccountsState state) {
    final count = state.isExpanded ? state.locations.length : 3;
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == count - 1 ? 0 : 10),
          child: LocationCard(location: state.locations[index], onChanged: (val) => state.onLocationToggle(index, val)),
        );
      }),
    );
  }

  static Widget buildExpansionButton(FoundAccountsState state) {
    return GestureDetector(
      onTap: state.onExpandToggle,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(5),
          color: AppColors.primary.withValues(alpha: 0.5),
          dashPattern: const [3, 3],
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 20),
              const SizedBox(width: 5),
              CustomText(
                "+${state.locations.length - 3} more locations",
                fontSize: 13,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildSummaryBar(FoundAccountsState state) {
    return CustomBorderContainer(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.lightCircleColor, width: 4),
            ),
            child: const Icon(Icons.bar_chart, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText("${state.selectedCount} locations selected", fontSize: 13, fontWeight: FontWeight.w500),
                const CustomText("\$8/month.", fontSize: 11, isSecondary: true),
              ],
            ),
          ),
          CustomText("\$${state.totalMonthlyPrice.toInt()}/month", fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.greenText),
        ],
      ),
    );
  }

  static Widget buildActionButtons(BuildContext context, FoundAccountsState state) {
    if (state.isSyncing) {
      return buildSyncingBox(context, state);
    }

    List<LocationData> selectedLocations = state.locations.where((l) => l.isSelected).toList();
    return Column(
      children: [
        CustomButton(
          wantBorder: false,
          isDisable: selectedLocations.isEmpty,
          customIcon: const Icon(Icons.arrow_forward_rounded),
          text: "Connect these locations and continue",
          onPressed: state.onConnect,
          alignment: IconAlignment.end,
        ),
        const SizedBox(height: 10),
        CustomButton(
          isSecondary: true,
          backgroundColor: AppColors.googleButtonGrey,
          text: "Use a different Google account",
          onPressed: state.onChangeAccount,
          textColor: AppColors.primary,
          customIcon: const CustomImage(AppImages.googleLogo),
        ),
      ],
    );
  }

  static Widget buildSyncingBox(BuildContext context, FoundAccountsState state) {
    final selectedLocations = state.locations.where((l) => l.isSelected).toList();
    return CustomBorderContainer(
      wantBorder: false,
      myColor: AppColors.primary.withValues(alpha: 0.05),
      child: Column(
        children: [
          const Row(
            children: [
              RotatingSyncIcon(),
              SizedBox(width: 12),
              CustomText("Syncing your reviews...", fontSize: 14, fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(height: 7),
          ...List.generate(selectedLocations.length, (index) {
            return SyncLocationProgress(
              locationName: selectedLocations[index].name,
              delay: Duration(milliseconds: index * 1000), // 1s delay between each
              onComplete: state.onSyncComplete,
            );
          }),
        ],
      ),
    );
  }

  static Widget buildFooter() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock, color: AppColors.lighterGrey, size: 16),
        SizedBox(width: 5),
        Flexible(child: CustomText("We never share your information with third parties.", fontSize: 12, isSecondary: true)),
      ],
    );
  }
}

class RotatingSyncIcon extends StatefulWidget {
  const RotatingSyncIcon({super.key});

  @override
  State<RotatingSyncIcon> createState() => _RotatingSyncIconState();
}

class _RotatingSyncIconState extends State<RotatingSyncIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..reverse()
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
      child: RotationTransition(
        turns: ReverseAnimation(_controller),
        child: const Icon(Icons.sync, color: AppColors.primary, size: 20),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final LocationData location;
  final ValueChanged<bool?> onChanged;

  const LocationCard({super.key, required this.location, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomBorderContainer(
      myColor: context.isDarkMode ? null : AppColors.lighterPrimaryColor,
      child: Row(
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
                CustomText(location.name, fontSize: 13, fontWeight: FontWeight.w500),
                CustomText(location.address, fontSize: 11, isSecondary: true),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.starColor, size: 14),
              const SizedBox(width: 4),
              CustomText(location.rating.toString(), fontSize: 13, fontWeight: FontWeight.w500),
              const SizedBox(width: 10),
              CustomCheckbox(value: location.isSelected, onChanged: onChanged),
            ],
          ),
        ],
      ),
    );
  }
}
