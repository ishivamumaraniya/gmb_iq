import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';
import 'package:gmb_iq/core/widgets/customLogo.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'widgets/login_components.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({super.key});

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
                    CustomLogo(logoSize: context.isMobile ? 25 : 20, textSize: 25),

                    // CustomImage(
                    //   AppImages.appLogo,
                    //   width: (context.isMobile ? 25 : 20).w,
                    //   height: (context.isMobile ? 25 : 20).h,
                    //   fit: BoxFit.contain,
                    // ),
                    const SizedBox(height: 40),
                    _buildLoginFormContent(context),
                    const Spacer(),
                    LoginComponents.buildTermsAndPrivacy(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginFormContent(BuildContext context) {
    final double logoHeight = context.isMobile ? 150 : 90;
    final double logoWidth = context.isMobile ? 200 : 100;

    return Column(
      children: [
        CustomImage(AppImages.loginLogo, height: logoHeight, width: logoWidth, fit: BoxFit.contain),
        const SizedBox(height: 40),
        const CustomText("Let's get started", fontSize: 26, fontWeight: FontWeight.w500),
        const SizedBox(height: 5),
        const CustomText(
          height: 1.25,
          isSecondary: true,
          "Connect your Google Business Profile\nto manage reviews, responses,\nand insights — all in one place.",
          fontSize: 15,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 45),
        LoginComponents.buildGoogleButton(context),
        const SizedBox(height: 60),
        LoginComponents.buildInfoLoginWidget(context),
      ],
    );
  }
}
