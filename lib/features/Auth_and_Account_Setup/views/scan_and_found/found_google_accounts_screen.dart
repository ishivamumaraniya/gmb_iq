import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/widgets/custom_checkbox.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/sync_location_progress.dart';
import '../../../../core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class FoundGoogleAccountsScreen extends StatefulWidget {
  const FoundGoogleAccountsScreen({super.key});

  @override
  State<FoundGoogleAccountsScreen> createState() => _FoundGoogleAccountsScreenState();
}

class _FoundGoogleAccountsScreenState extends State<FoundGoogleAccountsScreen> {
  bool isExpanded = false;
  bool isSyncing = false;
  int completedSyncs = 0;
  final List<LocationData> locations = [
    LocationData(name: "Main Branch", address: "123 Main street, New York, NY 10001", rating: 4.6, reviews: 128, isSelected: true),
    LocationData(name: "Downtown Location", address: "456 Downtown Ave, New York, NY 10002", rating: 4.2, reviews: 89, isSelected: true),
    LocationData(name: "Westside Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.9, reviews: 241, isSelected: false),
    LocationData(name: "Time Square Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.8, reviews: 120, isSelected: false),
    LocationData(name: "Northside Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.5, reviews: 95, isSelected: false),
  ];

  int get selectedCount => locations.where((l) => l.isSelected).length;

  double get totalMonthlyPrice => selectedCount * 8.0;

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 15),
                    _buildConnectedAccount(),
                    const SizedBox(height: 20),
                    _buildLocationsListHeader(),
                    const SizedBox(height: 10),
                    _buildLocationsList(),
                    if (!isExpanded && locations.length > 3) ...[const SizedBox(height: 10), _buildExpansionButton()],
                    const SizedBox(height: 25),
                    _buildSummaryBar(),
                    const SizedBox(height: 16),
                    _buildActionButtons(),
                    const Spacer(),
                    const SizedBox(height: 20),
                    _buildFooter(),
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
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.greenText.withValues(alpha: .1),
          child: const Icon(Icons.check_circle, color: AppColors.greenText, size: 33),
        ),
        const SizedBox(height: 15),
        const CustomText("Success! We found 5 locations", fontSize: 16, fontWeight: FontWeight.w500),
        const SizedBox(height: 5),
        const CustomText("on your Google Account", fontSize: 14, color: AppColors.textSecondary),
      ],
    );
  }

  Widget _buildConnectedAccount() {
    return CustomBorderContainer(
      myWidget: Row(
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
                CustomText("Connected as", fontSize: 12, color: AppColors.textSecondary),
                CustomText("wadewarren@gmail.com", fontSize: 14, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          CustomTextButton(text: "Change", onPressed: () {}, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildLocationsListHeader() {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                CustomTextSpan(
                  text: "Locations found ",
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextSpan(text: "(${locations.length})", fontSize: 13, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const CustomText("Select all", fontSize: 13, color: AppColors.primary),
            const SizedBox(width: 8),
            CustomCheckbox(
              value: selectedCount == locations.length,
              onChanged: (val) {
                setState(() {
                  for (var l in locations) {
                    l.isSelected = val ?? false;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationsList() {
    final count = isExpanded ? locations.length : 3;
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == count - 1 ? 0 : 10),
          child: LocationCard(
            location: locations[index],
            onChanged: (val) {
              setState(() {
                locations[index].isSelected = val ?? false;
              });
            },
          ),
        );
      }),
    );
  }

  Widget _buildExpansionButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = true;
        });
      },
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
              CustomText("+${locations.length - 3} more locations", fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryBar() {
    return CustomBorderContainer(
      myWidget: Row(
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
                CustomText("$selectedCount locations selected", fontSize: 13, fontWeight: FontWeight.w500),
                const CustomText("\$8/month.", fontSize: 11, color: AppColors.textSecondary),
              ],
            ),
          ),
          CustomText("\$${totalMonthlyPrice.toInt()}/month", fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.greenText),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    if (isSyncing) {
      return _buildSyncingBox();
    }

    List selectedLocations = locations.where((l) => l.isSelected).toList();
    return Column(
      children: [
        CustomButton(
          wantBorder: false,
          isDisable: selectedLocations.isEmpty,
          customIcon: const Icon(Icons.arrow_forward_rounded),
          text: "Connect these locations and continue",
          onPressed: () {
            setState(() {
              isSyncing = true;
              completedSyncs = 0;
            });
          },
          alignment: IconAlignment.end,
        ),
        const SizedBox(height: 10),
        CustomButton(
          isSecondary: true,
          backgroundColor: AppColors.googleButtonGrey,
          text: "Use a different Google account",
          onPressed: () {},
          textColor: AppColors.primary,
          customIcon: const CustomImage(AppImages.googleLogo),
        ),
      ],
    );
  }

  Widget _buildSyncingBox() {
    final selectedLocations = locations.where((l) => l.isSelected).toList();
    return CustomBorderContainer(
      wantBorder: false,
      myColor: AppColors.primary.withValues(alpha: 0.05),
      myWidget: Column(
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
              onComplete: () {
                completedSyncs++;
                if (completedSyncs == selectedLocations.length) {
                  // All complete, navigate after a small delay
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (mounted) {
                      context.pushNamed(AppRoutes.syncComplete, extra: selectedLocations);
                    }
                  });
                }
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock, color: AppColors.lighterGrey, size: 16),
        SizedBox(width: 5),
        Flexible(child: CustomText("We never share your information with third parties.", fontSize: 12, color: AppColors.textSecondary)),
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

class LocationData {
  final String name;
  final String address;
  final double rating;
  final int reviews;
  bool isSelected;

  LocationData({required this.name, required this.address, required this.rating, required this.reviews, this.isSelected = false});
}

class LocationCard extends StatelessWidget {
  final LocationData location;
  final ValueChanged<bool?> onChanged;

  const LocationCard({super.key, required this.location, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomBorderContainer(
      myColor: context.isDarkMode ? null : AppColors.lighterPrimaryColor,

      myWidget: Row(
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
                CustomText(location.address, fontSize: 11, color: AppColors.textSecondary),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.star,
                //       color: AppColors.starColor,
                //       size: 14,
                //     ),
                //     const SizedBox(width: 4),
                //     CustomText(
                //       location.rating.toString(),
                //       fontSize: 12,
                //       fontWeight: FontWeight.w600,
                //     ),
                //     const SizedBox(width: 4),
                //     CustomText(
                //       "(${location.reviews} reviews)",
                //       fontSize: 12,
                //       color: AppColors.textSecondary,
                //     ),
                //   ],
                // ),
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
