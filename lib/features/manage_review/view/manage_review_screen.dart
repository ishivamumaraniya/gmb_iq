import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ManageReviewScreen extends StatelessWidget {
  const ManageReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(title: 'Manage Review'),
      body: Center(
        child: Text('Manage Review Screen'),
      ),
    );
  }
}
