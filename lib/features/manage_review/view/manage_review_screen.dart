import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_widget.dart';
import 'desktop/manage_review_desktop_view.dart';
import 'mobile_tablet/manage_review_mobile_tablet_view.dart';

class ManageReviewScreen extends StatelessWidget {
  const ManageReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: ManageReviewDesktopView(),
      mobileTablet: ManageReviewMobileTabletView(),
    );
  }
}
