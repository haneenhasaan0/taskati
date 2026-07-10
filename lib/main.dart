import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/services/hive_helper.dart';
// import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/features/splash/splash_screen.dart';

import 'hive/hive_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPref.init();
  //await HiveHelperr.init();
  await HiveHelperr.init();
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Stack(
            children: [
              Container(
                color: AppColors.backgroundColor,
                width: double.infinity,
                height: double.infinity,
              ),
              Image.asset(
                AppImages.bg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              child ?? const SizedBox.shrink(),
            ],
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
