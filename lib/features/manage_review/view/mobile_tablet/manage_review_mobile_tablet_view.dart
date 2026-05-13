import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ManageReviewMobileTabletView extends StatelessWidget {
  const ManageReviewMobileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'Manage Reviews',
        subtitle: 'Mobile/Tablet view under construction',
      ),
      body: SizedBox.shrink(),
    );
  }
}
