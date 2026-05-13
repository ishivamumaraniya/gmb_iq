import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class BusinessProfileMobileTabletView extends StatelessWidget {
  const BusinessProfileMobileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'Business Profiles',
        subtitle: 'Mobile/Tablet view under construction',
      ),
      body: SizedBox.shrink(),
    );
  }
}
