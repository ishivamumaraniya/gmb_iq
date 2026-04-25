import 'package:flutter/material.dart';
import 'package:gmb_iq/core/responsive/responsive_context.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final EdgeInsetsGeometry padding;

  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16), // 16px horizontal default
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    final bool isDesktop = context.isDesktop;

    return Container(
      color: scaffoldColor,
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: scaffoldColor,
          appBar: appBar,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          extendBody: extendBody,
          body: Padding(padding: isDesktop ? EdgeInsetsGeometry.zero : padding, child: body),
        ),
      ),
    );
  }
}
