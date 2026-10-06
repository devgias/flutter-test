import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp.router(
        title: 'GitHub Users',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        builder: (context, child) => KeyboardDismisser(child: child!),
      ),
    );
  }
}
