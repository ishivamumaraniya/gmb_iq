import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/storage/hive_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Future.delayed(Duration(seconds: 5));

  // Initialize Storage
  await HiveSetup.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final Size designSize = constraints.maxWidth >= 1024
            ? Size(constraints.maxWidth, constraints.maxHeight)
            : const Size(375, 812);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'GMB IQ',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode
                  .light, // Change to .system if you want auto dark mode
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
