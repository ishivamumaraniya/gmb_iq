import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/blank/view/blank_screen.dart';
import '../../features/main_layout/view/main_layout.dart';
import '../widgets/custom_button.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String search = 'search';
  static const String cart = 'cart';
  static const String profile = 'profile';
  static const String blank = 'blank';
  static const String login = '/login';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(name: AppRoutes.splash, path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(name: AppRoutes.login, path: '/login', builder: (context, state) => const LoginScreen()),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(name: AppRoutes.home, path: '/home', builder: (context, state) => const HomeScreen()),
              GoRoute(name: AppRoutes.blank, path: '/blank', builder: (context, state) => const BlankScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.search,
                path: '/search',
                builder: (context, state) => Scaffold(
                  body: Center(
                    child: CustomButton(
                      text: 'Go to Blank Page',
                      onPressed: () => context.pushNamed(AppRoutes.blank),
                      customIcon: const Icon(Icons.arrow_forward, color: Colors.white),
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
                builder: (context, state) => Scaffold(body: Center(child: Text('Cart Screen'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.profile,
                path: '/profile',
                builder: (context, state) => Scaffold(body: Center(child: Text('Profile Screen'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
