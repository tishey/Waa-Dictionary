
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/share/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final IconData icon;
 final  Widget? trailing;
  const SettingCard({super.key, required this.title, required this.icon, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.secondaryColor.withOpacity(0.3)),
      child: ListTile(
          // leading: icon,
          title: Row(
            children: [
             Icon(icon, color: CustomColors.whiteColor,),
            const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CustomColors.whiteColor,
                      fontSize: 15.sp
                    ),
              ),
            ],
          ),
          trailing: trailing ,
          ),
    );
  }
}