import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmb_iq/features/Auth_and_Account_Setup/repository/auth_repository.dart';
import 'package:go_router/go_router.dart';
import '../../features/Auth_and_Account_Setup/cubit/auth_cubit.dart';

import '../../features/Auth_and_Account_Setup/views/login/login_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/blank/view/blank_screen.dart';
import '../../features/main_layout/view/main_layout.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../storage/hive_setup.dart';
import 'slide_transition_page.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String search = 'search';
  static const String cart = 'cart';
  static const String profile = 'profile';
  static const String login = 'login';
  static const String blank = 'blank';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final token = HiveSetup.token;

      if (token.isEmpty) {
        return '/login';
      }

      // If token is not empty and user tries to access login or splash, redirect to home
      if (state.matchedLocation == '/login' || state.matchedLocation == '/') {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        name: AppRoutes.splash,
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => AuthCubit(authRepository: AuthRepository()),
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: AppRoutes.login,
            path: '/login',
            pageBuilder: (context, state) => SlideTransitionPage(key: state.pageKey, child: const LoginScreen()),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.home,
                path: '/home',
                pageBuilder: (context, state) => SlideTransitionPage(key: state.pageKey, child: const HomeScreen()),
              ),
              GoRoute(
                name: AppRoutes.blank,
                path: '/blank',
                pageBuilder: (context, state) => SlideTransitionPage(key: state.pageKey, child: const BlankScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.search,
                path: '/search',
                pageBuilder: (context, state) => SlideTransitionPage(
                  key: state.pageKey,
                  child: CustomScaffold(
                    body: Center(
                      child: CustomButton(
                        text: 'Go to Blank Page',
                        onPressed: () => context.pushNamed(AppRoutes.blank),
                        customIcon: const Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.cart,
                path: '/cart',
                pageBuilder: (context, state) => SlideTransitionPage(
                  key: state.pageKey,
                  child: const CustomScaffold(body: Center(child: Text('Cart Screen'))),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.profile,
                path: '/profile',
                pageBuilder: (context, state) => SlideTransitionPage(
                  key: state.pageKey,
                  child: const CustomScaffold(body: Center(child: Text('Profile Screen'))),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
