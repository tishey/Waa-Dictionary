import 'package:dictionary/src/core/navigation/route.dart';
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/search_view/model/words_data.dart';
import 'package:dictionary/src/feature/search_view/view/meaning_view.dart';
import 'package:dictionary/src/share/search_textfield.dart';
import 'package:dictionary/src/share/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController _controller = TextEditingController();

  Widget searchIcon = const Icon(
    Icons.search,
    color: CustomColors.primaryColor,
  );

  final getWords = DictionWord.getWord();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/images/waa logo3.png',
            height: 30.h,
          ),
        ),
        backgroundColor: CustomColors.primaryColor,
        body: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              verticalSpace(40),
              //  UIHelper.verticalMedium
              // const Padding(padding: EdgeInsets.only(top: 30)),
              WaaTextField(
                prefixIcon: searchIcon,
                textEditingController: _controller,
              ),
              Expanded(
                  child: AnimationLimiter(
                child: ListView.builder(
                    itemCount: getWords.length,
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
                                onTap: () =>
                                    WaaNavigator.navigateToRoute(MeaningView(
                                  index: index,
                                )),
                                child: ListTile(
                                  title: Text(getWords[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: CustomColors.whiteColor,
                                              fontSize: 17.sp)),
                                  subtitle: Text(getWords[index].subtitle,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: CustomColors.whiteColor,
                                              fontSize: 13.sp)),
                                ),
                              ),
                            )),
                          ));
                    }),
              ))
            ],
          ),
        ));
  }
}
