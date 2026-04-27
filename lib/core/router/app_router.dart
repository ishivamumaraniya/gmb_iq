import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/Auth_and_Account_Setup/views/scan_and_found/found_google_accounts_screen.dart';
import '../../features/Auth_and_Account_Setup/views/scan_and_found/scanning_google_accounts_screen.dart';
import '../../features/Auth_and_Account_Setup/views/login/login_screen.dart';
import '../../features/Auth_and_Account_Setup/widget/auth_layout.dart';
import '../../features/splash/view/splash_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/blank/view/blank_screen.dart';
import '../../features/main_layout/view/main_layout.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import 'slide_transition_page.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String search = 'search';
  static const String cart = 'cart';
  static const String profile = 'profile';
  static const String blank = 'blank';
  static const String login = 'login';
  static const String scanningAccounts = 'scanning-accounts';
  static const String foundAccounts = "found-accounts";
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: AppRoutes.splash,
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return AuthLayout(child: child);
        },
        routes: [
          GoRoute(
            name: AppRoutes.login,
            path: '/login',
            pageBuilder: (context, state) => SlideTransitionPage(key: state.pageKey, child: const LoginScreen()),
          ),
          GoRoute(
            name: AppRoutes.scanningAccounts,
            path: '/scanning-accounts',
            pageBuilder: (context, state) =>
                SlideTransitionPage(key: state.pageKey, child: const ScanningGoogleAccountsScreen()),
          ),

          GoRoute(
            name: AppRoutes.foundAccounts,
            path: '/found-accounts',
            pageBuilder: (context, state) =>
                SlideTransitionPage(key: state.pageKey, child: const FoundGoogleAccountsScreen()),
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
