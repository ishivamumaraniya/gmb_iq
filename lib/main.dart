import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/storage/hive_setup.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/connectivity/connectivity_cubit.dart';
import 'core/widgets/connectivity_wrapper.dart';

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
    return BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final Size designSize = constraints.maxWidth >= 1024 ? Size(constraints.maxWidth, constraints.maxHeight) : const Size(375, 812);

          return ScreenUtilInit(
            designSize: designSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'GMB IQ',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.system,
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  return ConnectivityWrapper(child: child!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
