import 'package:flutter/material.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/views/scan_and_found/widgets/scanning_components.dart';

class ScanningMobileView extends StatelessWidget {
  final AnimationController progressController;

  const ScanningMobileView({super.key, required this.progressController});

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
                    ScanningComponents.buildProgressSection(progressController),
                    const SizedBox(height: 25),
                    ScanningComponents.buildLoadingSection(context),
                    const SizedBox(height: 25),
                    const Spacer(),
                    const SizedBox(height: 20),
                    ScanningComponents.buildAuthInfo(),
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
    return const Column(
      children: [
        CustomImage(AppImages.googleLogo, width: 40, height: 40, fit: BoxFit.contain),
        SizedBox(height: 15),
        CustomText(
          "Scanning your\nGoogle account...",
          fontSize: 22,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          height: 1.15,
        ),
        SizedBox(height: 5),
        CustomText(
          "Looking for your google Business locations",
          fontSize: 14,
          textAlign: TextAlign.center,
          isSecondary: true,
        ),
      ],
    );
  }
}
