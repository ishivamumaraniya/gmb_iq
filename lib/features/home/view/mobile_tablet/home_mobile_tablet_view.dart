import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HomeMobileTabletView extends StatelessWidget {
  const HomeMobileTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    // Returning a SizedBox as requested for the Mobile/Tablet view placeholder
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'Home',
        subtitle: 'Mobile/Tablet view under construction',
      ),
      body: SizedBox.shrink(),
    );
  }
}
