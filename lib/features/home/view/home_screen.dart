import 'package:flutter/material.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
