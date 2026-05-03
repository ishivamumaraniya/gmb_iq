import 'package:flutter/material.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/views/login/widgets/login_components.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/custom_text.dart';

class LoginDesktopView extends StatelessWidget {
  const LoginDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
        child: Column(
          children: [
            // Top Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CustomImage(AppImages.appLogo, width: 28, height: 28, fit: BoxFit.contain),
                    SizedBox(width: 10),
                    CustomText("GmbIQ", fontSize: 20, fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    CustomText("Need help? ", fontSize: 14, color: Theme.of(context).textTheme.bodySmall?.color),
                    InkWell(
                      onTap: () {},
                      child: const CustomText("Contact Support", fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Middle Section (Hero + Placeholder Image)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left Card (Hero Text & Login)
                  Expanded(
                    flex: 11,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Theme.of(context).dividerTheme.color ?? AppColors.customBorderColorGrey, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                                height: 1.2,
                              ),
                              children: const [
                                TextSpan(text: "Supercharge your\n"),
                                TextSpan(
                                  text: "Google Business ",
                                  style: TextStyle(color: AppColors.primary),
                                ),
                                TextSpan(text: "Profile"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          CustomText(
                            "Connect your account to manage reviews,\nautomate responses, and unlock powerful insights\nall from one dashboard.",
                            fontSize: 18,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            height: 1.5,
                          ),
                          const SizedBox(height: 40),
                          LoginComponents.buildGoogleButton(context),

                          const SizedBox(height: 24),
                          LoginComponents.buildTermsAndPrivacy(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Right Card (Blue Placeholder)
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24)),
                      child: const Center(
                        // Placeholder for the illustration in the design
                        child: CustomImage(AppImages.loginLogo, height: 200, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bottom Section (4 Feature Cards)
            SizedBox(
              height: 240, // Fixed height for bottom cards
              child: Row(
                children: [
                  _buildFeatureCard(
                    icon: Icons.shield_outlined,
                    iconColor: Colors.blue,
                    bgColor: Colors.blue.withValues(alpha: 0.1),
                    title: "Bank-grade Security",
                    description: "Your data is encrypted\nand completely private.\nWe never share your\ninformation.",
                    context: context,
                  ),
                  const SizedBox(width: 20),
                  _buildFeatureCard(
                    icon: Icons.bolt_outlined,
                    iconColor: Colors.purple,
                    bgColor: Colors.purple.withValues(alpha: 0.1),
                    title: "Lightning Fast",
                    description: "Connect your locations in\nseconds. Our automated\nsync keeps everything up\nto date.",
                    context: context,
                  ),
                  const SizedBox(width: 20),
                  _buildFeatureCard(
                    icon: Icons.bar_chart_outlined,
                    iconColor: Colors.green,
                    bgColor: Colors.green.withValues(alpha: 0.1),
                    title: "Deep Analytics",
                    description: "Get actionable insights\nacross all your locations.\nTrack growth and\nresponse rates.",
                    context: context,
                  ),
                  const SizedBox(width: 20),
                  _buildFeatureCard(
                    icon: Icons.monetization_on_outlined,
                    // Using a coin/circle placeholder
                    iconColor: Colors.orange,
                    bgColor: Colors.orange.withValues(alpha: 0.1),
                    title: "40% Cost Saving",
                    description: "Save time and resources\ncost at same time with\nautomatic reply",
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Theme.of(context).dividerTheme.color ?? AppColors.customBorderColorGrey, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 24),
            CustomText(title, fontSize: 16, fontWeight: FontWeight.bold),
            const SizedBox(height: 12),
            CustomText(description, fontSize: 14, color: Theme.of(context).textTheme.bodySmall?.color, height: 1.5),
          ],
        ),
      ),
    );
  }
}
