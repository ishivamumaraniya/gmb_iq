import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SettingsMobileTabletView extends StatelessWidget {
  const SettingsMobileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        subtitle: 'Mobile/Tablet view under construction',
      ),
      body: SizedBox.shrink(),
    );
  }
}
