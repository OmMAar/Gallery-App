import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:nabed_test/widgets/base_shimmer.dart';

import 'icon_title_shimmer_widget.dart';


class LoadingHomeWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoadingHomeWidget({required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: BaseShimmerWidget(
        child: Row(
          children: [
            Container(
              height: height,
              width: AppDimens.space32,
              alignment: AlignmentDirectional.bottomCenter,
              padding: const EdgeInsets.only(
                  bottom: AppDimens.space10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 14,
                    color: AppColors.white,
                  ),
                  VerticalPadding(percentage: .1),
                  Container(
                    height: 100,
                    width: 14,
                    color: AppColors.white,
                  ),
                  VerticalPadding(percentage: .1),
                  Container(
                    height: 100,
                    width: 14,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: AppDimens.space32),
                child: Container(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: AnimationLimiter(
                      child: Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 500),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            VerticalPadding(
                              percentage: 0.09,
                            ),


                            _buildTop1Shimmer(

                                width:width,
                            ),
                            VerticalPadding(
                              percentage: 0.06,
                            ),

                            _buildTop2Shimmer(
                                width: width,
                            ),
                            VerticalPadding(
                              percentage: 0.06,
                            ),

                            _buildTop2Shimmer(
                                width: width,
                            ),
                            VerticalPadding(
                              percentage: 0.1,
                            ),

                            Container(
                              width: width,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                  HorizontalPadding(
                                    percentage: 0.0001,
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                ],
                              ),
                            ),
                            VerticalPadding(
                              percentage: 0.0001,
                            ),
                            Container(
                              width: width,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                  HorizontalPadding(
                                    percentage: 0.0001,
                                  ),
                                  Expanded(
                                      flex:2,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                ],
                              ),
                            ),

                            VerticalPadding(
                              percentage: 0.0001,
                            ),


                            Container(
                              width: width,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                  HorizontalPadding(
                                    percentage: 0.0001,
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: IconTitleShimmerWidget(
                                        width: width,
                                      )),
                                  HorizontalPadding(
                                    percentage: 0.0001,
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: IconTitleShimmerWidget(
                                        width: width,

                                      )),


                                ],
                              ),
                            ),

                            VerticalPadding(
                              percentage: 0.1,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop1Shimmer({required double width}){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [

                Container(
                  color: AppColors.white,
                  width: 50,
                  height: 15,
                ),
                HorizontalPadding(percentage: 0.01,),
                Container(
                  color: AppColors.white,
                  width: 100,
                  height: 15,
                )

              ],
            ),
          ),
          VerticalPadding(percentage: 0.03,),
          Container(
            alignment: AlignmentDirectional.centerStart,
            color: AppColors.white,
            width: 130,
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildTop2Shimmer({required double width}){
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.space4,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            color: AppColors.white,
            width: width / 2.2,
            height: 15,
          ),
          VerticalPadding(
            percentage: 0.02,
          ),
          Container(
            width: width,
            height: 2,
            color: AppColors.white,

          ),
        ],
      ),
    );
  }
}
