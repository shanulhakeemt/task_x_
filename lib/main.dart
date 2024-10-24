import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_x/core/theme/theme.dart';
import 'package:task_x/features/home/view/pages/screen_home.dart';
import 'package:task_x/features/splash/view/pages/splash_screen.dart';

Future<void> main() async {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SplashScreen(),
    );
  }
}
