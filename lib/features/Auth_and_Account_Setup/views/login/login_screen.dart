import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_widget.dart';
import 'login_desktop_view.dart';
import 'login_mobile_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          // TODO: Route to Scanning Screen
          // context.pushNamed(AppRoutes.scanningAccounts);
          print("Login success! Route commented out per user request.");
        } else if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'Authentication failed')),
          );
        }
      },
      builder: (context, state) {
        return const ResponsiveWidget(
          mobileTablet: LoginMobileView(),
          desktop: LoginDesktopView(),
        );
      },
    );
  }
}
