import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/widgets/base_shimmer.dart';

class LoadingHomeWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoadingHomeWidget({required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: AnimationLimiter(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredGrid(
                    columnCount: 20,
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: 500),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                              child: BaseShimmerWidget(
                                child: Container(
                                  color: AppColors.white,
                                ),
                              ),
                            )))),
            itemCount: 20,
            shrinkWrap: true,
            // padding: const EdgeInsets.only(
            //     left: App.subSubMin, right: EdgeMargin.subSubMin),
            physics: NeverScrollableScrollPhysics(),
          ),
        ));

  }
}
