
import 'package:dictionary/src/core/util/colors.dart';
import 'package:flutter/cupertino.dart';

Widget customSwitch(BuildContext context, bool val, Function onChangedMethod) {
    return  CupertinoSwitch(
          activeColor: CustomColors.secondaryColor,
          trackColor:  CustomColors.blackColor.withOpacity(0.3),
          value: val, 
          onChanged: (newValue) {
            onChangedMethod(newValue);
          });
  
  }