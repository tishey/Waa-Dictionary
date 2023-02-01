import 'package:dictionary/src/animation/pop_animation.dart';
import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/feature/search_view/model/words_data.dart';
import 'package:dictionary/src/feature/search_view/riverpod/add_favourate.dart';
import 'package:dictionary/src/share/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final getFavourite = ChangeNotifierProvider<AddFavourite>((ref) => AddFavourite(),);
class MeaningView extends ConsumerWidget {
  MeaningView({ required this.index, super.key});

  final int index;
  
  final getMeaning = DictionWord.getWord();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

 
    final notifier = ref.watch(getFavourite);
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () => ref.read(getFavourite).addFav(index),
                child: PopUp(
                  animatedChild: Icons.star_rounded,
                ),
              ))
        ],
      ),
      backgroundColor: CustomColors.primaryColor,
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(40),
            Row(
              children: [
                Text(getMeaning[index].title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        color: CustomColors.whiteColor,
                        fontSize: 25.sp)),
                GestureDetector(
                  onTap: () {
                  },
                  child: PopUp(
                    animatedChild: Icons.audiotrack_rounded,
                  ),
                )
              ],
            ),
            verticalSpace(10.h),
            Text(getMeaning[index].meaning,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: CustomColors.whiteColor, fontSize: 15.sp)),
            // Container(
            //   width: screenWidth(context),
            //   padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.h),
            //   decoration: BoxDecoration(
            //     image: const DecorationImage(image: AssetImage('assets/images/spiral.png'), opacity: ),
            //       color: const Color.fromARGB(255, 103, 242, 103).withOpacity(0.8),
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         getMeaning[index].title,
            //         style: kFontStyle(context)
            //             .copyWith(
            //               fontWeight: FontWeight.bold, fontSize: 18.sp),
            //       ),
            //       Text(getMeaning[index].meaning),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
