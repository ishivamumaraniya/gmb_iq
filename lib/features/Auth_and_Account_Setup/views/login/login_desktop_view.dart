import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/customLogo.dart';
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
      padding: EdgeInsetsGeometry.zero,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomLogo(logoSize: 32, textSize: 20),

                  Row(
                    children: [
                      CustomText("Need help? ", fontSize: 14, color: Theme.of(context).textTheme.bodySmall?.color),
                      InkWell(
                        onTap: () {},
                        child: const CustomText("Contact Support", fontSize: 14, color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Middle Section (Hero + Placeholder Image)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left Card (Hero Text & Login)
                    Expanded(
                      flex: 3,
                      child: CustomBorderContainer(
                        elevation: 2,
                        padding: EdgeInsets.zero,
                        borderRadius: 30,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.googleSansFlex(
                                          fontSize: 40,
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
                                    const SizedBox(height: 20),
                                    const CustomText(
                                      isSecondary: true,
                                      "Connect your account to manage reviews,\nautomate responses, and unlock powerful insights\nall from one dashboard.",
                                      fontSize: 17,
                                      height: 1.5,
                                    ),
                                    const SizedBox(height: 40),
                                    LoginComponents.buildGoogleButton(context, maxWidth: 300),

                                    const SizedBox(height: 24),
                                    LoginComponents.buildTermsAndPrivacy(),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -200,
                              right: -200,
                              child: Container(
                                height: 450,
                                decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: .1), shape: BoxShape.circle),
                                width: 450,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const CustomBorderContainer(
                      myColor: Colors.transparent,
                      wantBorder: false,
                      borderRadius: 30,
                      elevation: 2,
                      padding: EdgeInsets.zero,
                      child: CustomImage(AppImages.desktopLoginLogo, borderRadius: 30),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Bottom Section (4 Feature Cards)
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFeatureCard(
                      icon: Icons.shield_outlined,
                      iconColor: Colors.blue,
                      bgColor: Colors.blue.withValues(alpha: 0.1),
                      title: "Bank-grade Security",
                      description: "Your data is encrypted and completely private. We never share your information.",
                      context: context,
                    ),
                    const SizedBox(width: 20),
                    _buildFeatureCard(
                      icon: TablerIcons.bolt,
                      iconColor: Colors.purple,
                      bgColor: Colors.purple.withValues(alpha: 0.1),
                      title: "Lightning Fast",
                      description: "Connect your locations in seconds. Our automated sync keeps everything up to date.",
                      context: context,
                    ),
                    const SizedBox(width: 20),
                    _buildFeatureCard(
                      icon: Icons.bar_chart_outlined,
                      iconColor: Colors.green,
                      bgColor: Colors.green.withValues(alpha: 0.1),
                      title: "Deep Analytics",
                      description: "Get actionable insights across all your locations. Track growth and response rates.",
                      context: context,
                    ),
                    const SizedBox(width: 20),
                    _buildFeatureCard(
                      icon: Icons.monetization_on_outlined,
                      // Using a coin/circle placeholder
                      iconColor: Colors.orange,
                      bgColor: Colors.orange.withValues(alpha: 0.1),
                      title: "40% Cost Saving",
                      description: "Save time and resources cost at same time with automatic reply",
                      context: context,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
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
      child: CustomBorderContainer(
        elevation: 2,
        padding: const EdgeInsets.all(30),
        borderRadius: 30,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 24),
            CustomText(title, fontSize: 18, fontWeight: FontWeight.w600),
            const SizedBox(height: 5),
            CustomText(description, fontSize: 14, isSecondary: true),
          ],
        ),
      ),
    );
  }
}
