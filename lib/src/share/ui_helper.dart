

 import 'package:flutter/material.dart';

class UIHelper {
   static const double mediumFont = 14.0;
   static const double largeFont = 24.0;
   

   // vertical spacing

   static const double mediumverSpace = 25;

 }

 double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 414);
  } else {
    return MediaQuery.of(context).size.height * (value / 1181);
  }
}


Widget verticalSpace(double? height) {
  return SizedBox(
    height: height ?? 30,
  );
}