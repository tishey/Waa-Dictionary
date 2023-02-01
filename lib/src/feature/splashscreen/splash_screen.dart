import 'dart:async';

import 'package:dictionary/src/animation/fade_in.dart';
import 'package:dictionary/src/core/navigation/route.dart';
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/custom_navbar/custom_navbar.dart';
import 'package:dictionary/src/share/font_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      WaaNavigator.navigateAndRemoveUntilRoute(const CustomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              fadeRightLogo(context),
              fadeLeftLogo(context),
            ],
          )),
          const Spacer(),
          FadeInBottom(
            animatedWidget: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'DICTIONARY',
                textAlign: TextAlign.center,
                style: kFontStyle(context)
                    .copyWith(color: CustomColors.whiteColor, fontSize: 18.sp),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget fadeRightLogo(BuildContext context) {
    Widget imageWidget =
        Image.asset('assets/images/waa logo1.png', width: 80.w);
    return FadeInRight(animatedWidget: imageWidget);
  }

  Widget fadeLeftLogo(BuildContext context) {
    Widget imageWidget =
        Image.asset('assets/images/waa logo2.png', width: 65.w);
    return FadeInleft(animatedWidget: imageWidget);
  }
}
