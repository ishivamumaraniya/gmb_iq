import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'side_navigation.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SizedBox(
        width: 280, // Custom sized box width for the drawer
        child: Drawer(child: SideNavigation(navigationShell: navigationShell, isMobile: true)),
      ),
      body: navigationShell,
    );
  }
}
