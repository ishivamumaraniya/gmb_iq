import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context, 'Mobile/Tablet Home Screen'),
      desktop: _buildUI(context, 'Desktop Home Screen'),
    );
  }

  Widget _buildUI(BuildContext context, String text) {
    return CustomScaffold(
      appBar: AppBar(title: Text(text)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Home',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Go to Blank Page',
                onPressed: () => context.pushNamed(AppRoutes.blank),
                customIcon: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
              const SizedBox(height: 16),
              CustomButton(
                  text: 'Loading Button', onPressed: () {}, isLoading: true),
            ],
          ),
        ),
      ),
    );
  }
}
