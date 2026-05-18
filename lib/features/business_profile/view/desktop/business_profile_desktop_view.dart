import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/CustomBorderContainers.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_button.dart';
import 'package:dotted_border/dotted_border.dart';

class BusinessProfileDesktopView extends StatelessWidget {
  const BusinessProfileDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'Business Profiles',
        subtitle: 'Manage your connected Google Business locations and sync settings.',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _buildProfileCard(
                  context,
                  initial: "W",
                  name: "Westside Clinic",
                  address: "789 West Blvd, New York, NY 10003",
                  rating: "4.9",
                  reviews: "342",
                  isConnected: false,
                ),
                _buildProfileCard(
                  context,
                  initial: "M",
                  name: "Main Branch",
                  address: "123 Main Street, New York, NY 10001",
                  rating: "4.7",
                  reviews: "179",
                  isConnected: true,
                ),
                _buildProfileCard(
                  context,
                  initial: "D",
                  name: "Downtown Location",
                  address: "456 Downtown Ave, New York, NY 10002",
                  rating: "4.4",
                  reviews: "77",
                  isConnected: true,
                ),
                _buildAddLocationCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context, {
    required String initial,
    required String name,
    required String address,
    required String rating,
    required String reviews,
    required bool isConnected,
  }) {
    return CustomBorderContainer(
      maxWidth: 480, // Half width minus spacing
      padding: const EdgeInsets.all(24),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.customBorderColorGrey),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: CustomText(initial, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(name, fontSize: 16, fontWeight: FontWeight.w600),
                    const SizedBox(height: 4),
                    CustomText(address, fontSize: 13, isSecondary: true),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.customBorderColorGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText("RATING", fontSize: 10, fontWeight: FontWeight.w600, isSecondary: true),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star_outline, size: 16, color: Colors.orange),
                          const SizedBox(width: 4),
                          CustomText(rating, fontSize: 16, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.customBorderColorGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText("REVIEWS", fontSize: 10, fontWeight: FontWeight.w600, isSecondary: true),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline, size: 16, color: Colors.blue),
                          const SizedBox(width: 4),
                          CustomText(reviews, fontSize: 16, fontWeight: FontWeight.w600),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: isConnected ? Colors.green : Colors.red, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  CustomText(isConnected ? "Connected & Syncing" : "Needs Re-authentication", fontSize: 13, isSecondary: true),
                ],
              ),
              CustomTextButton(text: "Manage", onPressed: () {}, color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddLocationCard(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        color: AppColors.customBorderColorGrey,
        strokeWidth: 2,
        dashPattern: const [8, 4],
        radius: const Radius.circular(16),
      ),
      child: Container(
        width: 480,
        height: 275,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.customBorderColorGrey),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              alignment: Alignment.center,
              child: const CustomText("G", fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const CustomText("Connect Google Account", fontSize: 16, fontWeight: FontWeight.w600),
            const SizedBox(height: 8),
            const CustomText(
              "Link another Google Business\nProfile to manage it from here.",
              fontSize: 13,
              isSecondary: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                elevation: 0,
              ),
              icon: const Icon(Icons.add, size: 18),
              label: const CustomText("Add Location", fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
