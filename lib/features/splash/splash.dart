import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/lottie.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/app_styles.dart';
import 'package:taskati/features/profile/profle.dart';

import '../../core/constants/app_images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      pushTo(context, Profile());
    });
  }
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Lottie.asset(AppLottie.lottie),
                SizedBox(height: 12),
                Text("Taskati", style: AppStyles.headline),
                SizedBox(height: 18),
                Text(
                  "It’s time to get organized",
                  style: AppStyles.caption1.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
