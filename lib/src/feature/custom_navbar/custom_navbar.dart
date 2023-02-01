  

  import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/favourite/view/favourite_main_view.dart';
import 'package:dictionary/src/feature/search_view/view/search_main_view.dart';
import 'package:dictionary/src/feature/settings/view/settings_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this)..addListener(() {});
    super.initState();
  }

  int activeIndex = 0;
  changeActiveIndexstate(int index) {
    setState(() {
      activeIndex = index;
    });
  }

 
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
             SearchView(),
             FavouriteView(),
             SettingView()
            ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-1, 1),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(0.4),
                  )
                ],
                color: CustomColors.whiteColor,
              ),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5,),
              height: 75,
              child: TabBar(
                  isScrollable: false,
                  onTap: (value) {
                    changeActiveIndexstate(value);
                  },
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  labelColor: CustomColors.whiteColor,
                  splashFactory: NoSplash.splashFactory,
                  indicatorWeight: 0.02,
                  controller: _tabController,
                  tabs: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: _tabController.index == 0 ? CustomColors.primaryColor : CustomColors.whiteColor,
                          child: Image.asset('assets/images/search.png', height: 16.h, color: _tabController.index == 0 ? CustomColors.whiteColor : CustomColors.primaryColor)
                        ),
                       
                        if (_tabController.index == 0)
                          Text(
                            "Search",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: CustomColors.blackColor,
                                ),
                          )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CircleAvatar(
                          backgroundColor: _tabController.index == 1 ? CustomColors.primaryColor : CustomColors.whiteColor,
                          child:  Image.asset('assets/images/favourite.png', height: 16.h, color: _tabController.index == 1 ? CustomColors.whiteColor : CustomColors.primaryColor)
                        ),
                       
                        if (_tabController.index == 1)
                          Text(
                            "Favourite",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: CustomColors.blackColor,
                                ),
                          )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CircleAvatar(
                          backgroundColor: _tabController.index == 2 ? CustomColors.primaryColor : CustomColors.whiteColor,
                          child:  Image.asset('assets/images/settings.png', height: 16.h, color: _tabController.index == 2 ? CustomColors.whiteColor : CustomColors.primaryColor)
                        ),
                        if (_tabController.index == 2)
                          Text(
                            "Settings",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: CustomColors.primaryColor,
                                ),
                          )
                      ],
                    ),
                  ]),
            ),
          ],
        )
      ],
    ));

    // bottomNavigationBar:
  }
}
