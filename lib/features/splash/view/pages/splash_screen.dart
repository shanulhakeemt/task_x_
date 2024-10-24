import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_x/core/theme/app_pallete.dart';
import 'package:task_x/features/home/controller/home_controller.dart';
import 'package:task_x/features/home/repository/home_repository.dart';
import 'package:task_x/features/home/view/pages/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) async {
            await Get.put(HomeController()).getProductModels();
          },
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenHome(),
          ),
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash",
          style: GoogleFonts.poppins(
              color: Pallete.whiteColor,
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
