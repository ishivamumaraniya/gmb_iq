import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ActivityMobileTabletView extends StatelessWidget {
  const ActivityMobileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'Activity',
        subtitle: 'Mobile/Tablet view under construction',
      ),
      body: SizedBox.shrink(),
    );
  }
}
