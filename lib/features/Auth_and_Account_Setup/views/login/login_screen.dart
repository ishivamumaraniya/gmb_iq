import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_widget.dart';
import 'login_desktop_view.dart';
import 'login_mobile_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../../../../core/utils/toast_helper.dart';

import '../scan_and_found/found_accounts/found_google_accounts_screen.dart';
import '../scan_and_found/scanning/scanning_google_accounts_screen.dart';
import '../scan_and_found/sync_complete/sync_complete_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.failure) {
          ToastHelper.show(
            context: context,
            type: AppToastType.success,
            customTitle: state.error,
          );
        }
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: _buildStepScreen(state),
        );
      },
    );
  }

  Widget _buildStepScreen(AuthState state) {
    switch (state.step) {
      case AuthStep.login:
        return ResponsiveWidget(
          key: const ValueKey('login'),
          mobileTablet: const LoginMobileView(),
          desktop: const LoginDesktopView(),
        );
      case AuthStep.scanning:
        return const ScanningGoogleAccountsScreen(key: ValueKey('scanning'));
      case AuthStep.foundAccounts:
        return const FoundGoogleAccountsScreen(key: ValueKey('foundAccounts'));
      case AuthStep.syncComplete:
        return SyncCompleteScreen(
          key: const ValueKey('syncComplete'),
          syncedLocations: state.syncedLocations,
        );
    }
  }
}
