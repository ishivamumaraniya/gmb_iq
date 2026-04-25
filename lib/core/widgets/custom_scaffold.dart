import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    this.padding = const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: kIsWeb ? 10 : 0), // 16px horizontal default
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    final mySize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Padding(
          padding: padding,
          child: SizedBox(height: mySize.height, width: mySize.width, child: body),
        ),
      ),
    );
  }
}
