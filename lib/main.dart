
import 'package:dictionary/src/core/navigation/route.dart';
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return  MaterialApp(
          title: 'Waa',
          color: CustomColors.primaryColor,
          debugShowCheckedModeBanner: false,
          navigatorKey: WaaNavigator.navigatorKey,
          scaffoldMessengerKey: WaaNavigator.scaffoldMessengerKey,
          theme: ThemeData(
            fontFamily: 'Louis George Cafe',
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}


