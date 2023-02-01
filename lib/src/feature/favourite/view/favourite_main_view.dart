import 'package:dictionary/src/core/navigation/route.dart';
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/search_view/view/meaning_view.dart';
import 'package:dictionary/src/share/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FavouriteView extends ConsumerWidget {
  FavouriteView({super.key});

  // final getWords = DictionWord.getWord();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(getFavourite);

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
          width: screenWidth(context),
          height: screenHeight(context),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: AnimationLimiter(
              child: notifier.favouriteData.isNotEmpty
                  ? ListView.builder(
                      itemCount: notifier.favouriteData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              horizontalOffset: 30,
                              child: FadeInAnimation(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: CustomColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.w, vertical: 5.h),
                                  margin: EdgeInsets.symmetric(vertical: 2.sp),
                                  child: GestureDetector(
                                    // onTap: () => WaaNavigator.navigateToRoute(
                                    //     MeaningView(
                                    //   index: index,
                                    // )),
                                    child: ListTile(
                                      title: Text(
                                          notifier.favouriteData[index].title,
                                          // getWords[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  color:
                                                      CustomColors.whiteColor,
                                                  fontSize: 17.sp)),
                                      subtitle: Text(
                                          notifier
                                              .favouriteData[index].subtitle,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color:
                                                      CustomColors.whiteColor,
                                                  fontSize: 13.sp)),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      })
                  : Center(
                      child: Text('No Favourite yet',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: CustomColors.whiteColor))))),
    );
  }
}
