import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/widget/customAuthInfoBox.dart';

import '../../../../core/theme/app_colors.dart';

class FoundGoogleAccountsScreen extends StatelessWidget {
  const FoundGoogleAccountsScreen({super.key});

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
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.greenText.withValues(
                        alpha: .1,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: AppColors.greenText,
                        size: 33,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const CustomText(
                      "Success! We found 5 locations",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),

                    const CustomText(
                      "on your Google Account",
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 15),

                    const CustomAuthInfoBox(
                      wantSubtitleColor: true,
                      image: AppImages.lockLogo,
                      myColor: AppColors.greenText,
                      title: "",
                      subtitle:
                          "Your locations have been securely retrieved from Google. ",
                    ),

                    const SizedBox(height: 10),

                    CustomBorderContainer(
                      myWidget: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: AppColors.primary.withValues(
                              alpha: .1,
                            ),
                            child: const CustomText(
                              "W",
                              fontSize: 20,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  "Connected as",
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                                CustomText(
                                  "wadewarren@gmail.com",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),

                          CustomText(
                            "Change",
                            fontSize: 13,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                CustomTextSpan(
                                  text: "Locations Found ",
                                  fontSize: 13,
                                  color: AppColors.textPrimary,
                                ),
                                CustomTextSpan(
                                  text: "(5)",
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            const CustomText(
                              "Select All",
                              fontSize: 13,
                              color: AppColors.primary,
                            ),
                            Checkbox(
                              value: true,
                              onChanged: (val) {},
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ],
                        ),
                      ],
                    ),

                    // _buildHeader(),
                    // const SizedBox(height: 20),
                    // _buildProgressSection(),
                    // const SizedBox(height: 25),
                    // _buildLoadingSection(),
                    //
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.pushNamed(AppRoutes.foundAccounts);
                    //   },
                    //   child: const Text("data"),
                    // ),
                    const SizedBox(height: 25),
                    const Spacer(),
                    const SizedBox(height: 20),

                    const Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          color: AppColors.lighterGrey,
                          size: 18,
                        ),

                        Flexible(
                          child: CustomText(
                            "We never share your information with third parties.",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    // _buildAuthInfo(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
