import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class YourIqAiScreen extends StatelessWidget {
  const YourIqAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(title: 'Your IQ AI'),
      body: Center(
        child: Text('Your IQ AI Screen'),
      ),
    );
  }
}
