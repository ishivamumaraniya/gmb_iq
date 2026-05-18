import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';
import 'package:gmb_iq/core/widgets/custom_text_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/CustomBorderContainers.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_outline_button.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'Welcome to GmbIQ, Wade!', subtitle: "Let's set up your first AI reply in under a minute"),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000), // Max width to look good on ultra-wide
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBanner(context),
                const SizedBox(height: 32),
                _buildChecklistCard(context),
                const SizedBox(height: 48),
                _buildStatsSection(context),
                const SizedBox(height: 48),
                _buildBusinessProfilesSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBanner(BuildContext context) {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      borderRadius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      myColor: context.isDarkMode ? null : AppColors.secondaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("You're all set up. Now what?", fontSize: 20, fontWeight: FontWeight.w500),
                SizedBox(height: 8),
                CustomText(
                  "We've connected your 3 Google locations and pulled in all your existing reviews.\nWant to see how the AI replies in your tone? Try it on a real review now.",
                  fontSize: 14,
                  isSecondary: true,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomButton(
                text: "Try IQ AI on a real review",
                width: 270,
                onPressed: () {},
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                customIcon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                alignment: IconAlignment.end,
              ),
              const SizedBox(height: 8),

              CustomTextButton(
                text: "Or take the 2-minute tour",
                onPressed: () {},
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCard(BuildContext context) {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.all(32),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText("Get the most out of GmbIQ", fontSize: 20, fontWeight: FontWeight.w500),
          const SizedBox(height: 8),
          const CustomText("Complete these steps to be fully set up.", fontSize: 14, isSecondary: true),
          const SizedBox(height: 32),
          _buildChecklistItem(
            context: context,
            title: "Connect Google Business Profile",
            subtitle: "Done — 3 locations synced.",
            isDone: true,
            actionText: "Done",
          ),
          const Divider(height: 32),
          _buildChecklistItem(
            context: context,
            title: "Configure your IQ AI tone",
            subtitle: "Pick how the AI should sound when replying.",
            isDone: false,
            actionText: "Start",
          ),
          const Divider(height: 32),
          _buildChecklistItem(
            context: context,
            title: "Generate your first AI reply",
            subtitle: "Try it on a real review to see the magic.",
            isDone: false,
            actionText: "Start",
          ),
          const Divider(height: 32),
          _buildChecklistItem(
            context: context,
            title: "Invite your team (optional)",
            subtitle: "Coming in V2",
            isDone: false,
            actionText: "V2",
            actionColor: AppColors.primary.withValues(alpha: 0.1),
            actionTextColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool isDone,
    required String actionText,
    Color? actionColor,
    Color? actionTextColor,
  }) {
    return Row(
      children: [
        Icon(
          isDone ? Icons.check_circle_outline : Icons.radio_button_unchecked,
          color: isDone ? AppColors.greenText : AppColors.lightGrey,
          size: 24,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title, fontSize: 16, fontWeight: FontWeight.w500, color: isDone ? AppColors.lightGrey : null),
              const SizedBox(height: 4),
              CustomText(subtitle, fontSize: 14, isSecondary: true),
            ],
          ),
        ),
        CustomOutlineButton(text: actionText, onPressed: () {}, backgroundColor: actionColor, textColor: actionTextColor),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText("Your Business Overview", fontSize: 20, fontWeight: FontWeight.w600),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                "Time Saved w/ AI",
                "124 hrs",
                Icons.access_time,
                Colors.blue.shade50,
                Colors.blue,
                trendText: "1.4h vs last month",
                isPositiveTrend: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildStatCard(
                context,
                "Unanswered Reviews",
                "23",
                Icons.error_outline,
                Colors.red.shade50,
                Colors.red,
                trendText: "Action Required",
                isPositiveTrend: false,
                isActionRequired: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildStatCard(
                context,
                "Total Reviews",
                "256",
                Icons.chat_bubble_outline,
                Colors.green.shade50,
                Colors.green,
                trendText: "23 More vs last month",
                isPositiveTrend: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildStatCard(
                context,
                "Average Rating",
                "4.5",
                Icons.star_outline,
                Colors.orange.shade50,
                Colors.orange,
                trendText: "15% vs last month",
                isPositiveTrend: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color iconBgColor,
    Color iconColor, {
    required String trendText,
    required bool isPositiveTrend,
    bool isActionRequired = false,
  }) {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.all(14),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 14),
          CustomText(title, fontSize: 14, isSecondary: true),
          const SizedBox(height: 4),
          CustomText(value, fontSize: 32, fontWeight: FontWeight.w700),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isActionRequired ? Colors.red.shade50 : (isPositiveTrend ? Colors.green.shade50 : Colors.red.shade50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isActionRequired)
                  Icon(
                    isPositiveTrend ? Icons.trending_up : Icons.trending_down,
                    size: 14,
                    color: isPositiveTrend ? Colors.green.shade700 : Colors.red.shade700,
                  ),
                if (!isActionRequired) const SizedBox(width: 4),
                CustomText(
                  trendText,
                  fontSize: 12,
                  color: isActionRequired ? Colors.red.shade700 : (isPositiveTrend ? Colors.green.shade700 : Colors.red.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildBusinessProfilesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText("Your Business Profiles", fontSize: 20, fontWeight: FontWeight.bold),
            CustomTextButton(
              onPressed: () {},
              text: "View all",
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              customIcon: const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.primary),
              alignment: IconAlignment.end,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildProfileListItem(context, "M", "Main Branch", "123 Main Street, New York, NY 10001", "4.7", "179", "7", "+18%"),
        const SizedBox(height: 16),
        _buildProfileListItem(context, "D", "Downtown Location", "456 Downtown Ave, New York, NY 10002", "4.4", "77", "2", "+18%"),
        const SizedBox(height: 16),
        _buildProfileListItem(context, "W", "Westside Clinic", "789 West Blvd, New York, NY 10003", "4.9", "342", "12", "+24%"),
      ],
    );
  }

  Widget _buildProfileListItem(
    BuildContext context,
    String initial,
    String name,
    String address,
    String rating,
    String reviews,
    String questions,
    String growth,
  ) {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      borderRadius: 12,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.customBorderColorGrey),
              borderRadius: BorderRadius.circular(8),
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
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.customBorderColorGrey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email_outlined, size: 14, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      CustomText("wade.warren@gmail.com", fontSize: 12, isSecondary: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Verified badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline, size: 14, color: Colors.green.shade700),
                const SizedBox(width: 4),
                CustomText("VERIFIED", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green.shade700),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Row(
            children: [
              const Icon(Icons.star_outline, size: 20, color: Colors.orange),
              const SizedBox(width: 4),
              CustomText(rating, fontSize: 14, fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(width: 32),
          Row(
            children: [
              const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.blue),
              const SizedBox(width: 4),
              CustomText(reviews, fontSize: 14, fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(width: 32),
          Row(
            children: [
              const Icon(Icons.help_outline, size: 20, color: Colors.red),
              const SizedBox(width: 4),
              CustomText(questions, fontSize: 14, fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(width: 32),
          Row(
            children: [
              const Icon(Icons.trending_up, size: 20, color: Colors.green),
              const SizedBox(width: 4),
              CustomText(growth, fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
