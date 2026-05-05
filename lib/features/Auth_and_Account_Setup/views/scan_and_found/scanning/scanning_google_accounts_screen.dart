import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/views/scan_and_found/scanning/scanning_desktop_view.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/views/scan_and_found/scanning/scanning_mobile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/responsive/responsive_context.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_state.dart';

enum loadingRowStatus { initial, loading, success }

class ScanningGoogleAccountsScreen extends StatefulWidget {
  const ScanningGoogleAccountsScreen({super.key});

  @override
  State<ScanningGoogleAccountsScreen> createState() => _ScanningGoogleAccountsScreenState();
}

class _ScanningGoogleAccountsScreenState extends State<ScanningGoogleAccountsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _startProgress();
  }

  void _startProgress() {
    _progressController = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _progressController.forward();
    });

    _progressController.status.isCompleted;

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<AuthCubit>().updateStep(AuthStep.foundAccounts);
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose(); // Prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? ScanningDesktopView(progressController: _progressController)
        : ScanningMobileView(progressController: _progressController);
  }
}
