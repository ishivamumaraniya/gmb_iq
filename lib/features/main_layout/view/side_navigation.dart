import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import 'main_layout.dart';

class SideNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool isMobile;

  const SideNavigation({super.key, required this.navigationShell, required this.isMobile});

  final double itemHeight = 44.0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final onSurfaceVariantColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Theme(
      data: Theme.of(context).copyWith(
        navigationDrawerTheme: const NavigationDrawerThemeData(indicatorSize: Size(double.infinity, 45)),
        hoverColor: Colors.white,
      ),
      child: NavigationDrawer(
        header: Padding(
          padding: const .symmetric(vertical: 20),
          child: CustomImage(AppImages.appLogo, height: 30, fit: BoxFit.contain, color: isDark ? Colors.white : null),
        ),
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: AppColors.primary.withValues(alpha: .10),
        onDestinationSelected: (index) {
          MainLayout.scaffoldKey.currentState?.closeDrawer();
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        footer: _buildAiVisibilityCard(context, isDark),
        children: [
          const Divider(indent: 16, endIndent: 16),

          // 2. Reusable destinations rendered beautifully using helper methods (solving Flutter's drawer parent lookup assertion)
          _buildDestination(
            index: 0,
            label: 'Home',
            svgPath: AppImages.homeSideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),

          _buildDestination(
            index: 1,
            label: 'Manage Review',
            svgPath: AppImages.manageSideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),

          _buildDestination(
            index: 2,
            label: 'Business Profile',
            svgPath: AppImages.businessSideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),

          _buildDestination(
            index: 3,
            label: 'Activity',
            svgPath: AppImages.activitySideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),

          _buildDestination(
            index: 4,
            label: 'Your IQ AI',
            svgPath: AppImages.iqAiSideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),

          _buildDestination(
            index: 5,
            label: 'Settings',
            svgPath: AppImages.settingSideNav,
            currentIndex: navigationShell.currentIndex,
            isDark: isDark,
            onSurfaceVariantColor: onSurfaceVariantColor,
          ),
        ],
      ),
    );
  }

  // Helper method for inline NavigationDrawerDestination generation (Safe from parent lookup assertions!)
  NavigationDrawerDestination _buildDestination({
    required int index,
    required String label,
    required String svgPath,
    required int currentIndex,
    required bool isDark,
    required Color onSurfaceVariantColor,
  }) {
    final isSelected = currentIndex == index;

    return NavigationDrawerDestination(
      icon: CustomImage(svgPath, height: 20, width: 20, color: isSelected ? AppColors.primary : null),
      label: CustomText(label, fontSize: 14, fontWeight: FontWeight.w500, color: isSelected ? AppColors.primary : onSurfaceVariantColor),
    );
  }

  // --- PREMIUM AI VISIBILITY CARD FOOTER ---
  Widget _buildAiVisibilityCard(BuildContext context, bool isDark) {
    final cardBgColor = isDark ? const Color(0xFF111E1A) : const Color(0xFFF4FBF8);
    final cardBorderColor = isDark ? const Color(0xFF1F3A30) : const Color(0xFFE2F3EB);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardBorderColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              'AI Visibility Check',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
            const SizedBox(height: 6),
            const CustomText('Discover your AI visibility on all platforms for free.', fontSize: 12, isSecondary: true, maxLines: 2),
            const SizedBox(height: 16),

            // Row of AI Brand Logo PNGs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomImage(AppImages.chatGptFooter, width: 32, height: 32),
                const CustomImage(AppImages.claudeFooter, width: 32, height: 32),
                const CustomImage(AppImages.geminiFooter, width: 32, height: 32),
                const CustomImage(AppImages.perplexityFooter, width: 32, height: 32),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isDark ? Colors.grey[700]! : const Color(0xFFE2E8F0), width: 1),
                  ),
                  child: CustomText(
                    '3+',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey[400] : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Button: Check Now for free (Using CustomButton!)
            CustomButton(
              text: 'Check Now for free',
              onPressed: () {},
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
              wantBorder: false,
            ),
          ],
        ),
      ),
    );
  }
}
