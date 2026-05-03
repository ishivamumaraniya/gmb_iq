import 'package:flutter/material.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/views/scan_and_found/widgets/scanning_components.dart';

class ScanningDesktopView extends StatelessWidget {
  final AnimationController progressController;

  const ScanningDesktopView({super.key, required this.progressController});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsetsGeometry.zero,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Column: Logo & Text
          Expanded(
            flex: 1,
            child: CustomBorderContainer(
              wantBorder: false,
              myColor: Theme.of(context).primaryColor.withValues(alpha: .05),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBorderContainer(
                      boxShape: BoxShape.circle,
                      wantBorder: false,
                      elevation: 2,
                      child: CustomImage(AppImages.googleLogo, width: 40, height: 40, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20),
                    CustomText("Scanning your Google account...", fontSize: 32, fontWeight: FontWeight.w700),
                    CustomText("Looking for your Google Business locations", fontSize: 16, isSecondary: true),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 40),

          // Right Column: Scanning Status Boxes
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScanningComponents.buildProgressSection(progressController),
                  const SizedBox(height: 25),
                  ScanningComponents.buildLoadingSection(context),
                  const SizedBox(height: 25),
                  ScanningComponents.buildAuthInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
