import 'package:flutter/material.dart';
import 'package:gmb_iq/core/router/app_router.dart';
import 'package:gmb_iq/core/widgets/customLogo.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/connectivity/connectivity_cubit.dart';
import '../../../core/responsive/responsive_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateFunc();
  }

  void _navigateFunc() async {
    await context.read<ConnectivityCubit>().checkConnectivity();

    if (!mounted) return;
    context.pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobileTablet: _buildUI(context),
      desktop: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return const CustomScaffold(body: Center(child: CustomLogo()));
  }
}
