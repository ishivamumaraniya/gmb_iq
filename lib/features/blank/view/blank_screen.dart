import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_widget.dart';
import '../../../core/widgets/custom_button.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context, 'Mobile/Tablet Blank Screen'),
      desktop: _buildUI(context, 'Desktop Blank Screen'),
    );
  }

  Widget _buildUI(BuildContext context, String text) {
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'This is a Blank Page',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Go Back',
                onPressed: () => context.pop(),
                backgroundColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
