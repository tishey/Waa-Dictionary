import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/settings/view/widget/custom_switch.dart';
import 'package:dictionary/src/feature/settings/view/widget/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingView extends StatefulWidget {
  SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool lightMode = false;

  void toggleMode(bool newMode) {
    setState(() {
      lightMode = newMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/images/waa logo3.png',
            height: 30.h,
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SettingCard(
                  title: 'Light Mode', icon: Icons.light_mode,
                  trailing: customSwitch(context, lightMode, toggleMode),
                  // trailing: Checkbox(value: lightMode,
                  // onChanged: (newMode){
                  //   lightMode = newMode!;
                  // }
                  // ),
                ),
                const SettingCard(
                  title: 'Share to a Friend',
                  icon: Icons.share,
                ),
                const SettingCard(
                  title: 'Meet the Team',
                  icon: Icons.people_outline_outlined,
                ),
                const SettingCard(
                  title: 'Leave a Review',
                  icon: Icons.messenger_outline_sharp,
                ),
                const SettingCard(
                  title: 'Contact Us',
                  icon: Icons.call_outlined,
                )
              ],
            )));
  }
}
