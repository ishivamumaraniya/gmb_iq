import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context, 'Mobile/Tablet Splash'),
      desktop: _buildUI(context, 'Desktop Splash'),
    );
  }

  Widget _buildUI(BuildContext context, String text) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flash_on, size: 80, color: Colors.white),
            const SizedBox(height: 16),
            Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => context.goNamed(AppRoutes.home), child: const Text('Go to Hasome')),
          ],
        ),
      ),
    );
  }
}
