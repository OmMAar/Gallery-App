import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';

class HomeAppBarWidget extends StatelessWidget {
  final String name;
  final String? title;
  final Widget? image;
  const HomeAppBarWidget({required this.name,this.title,this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FadeInDown(
              delay: Duration(milliseconds: 1500),
              duration: Duration(milliseconds: 2500),
              animate: true,
              child: Container(
                child: Center(
                  child: Row(
                    children: [
                      image ??
                          Image.asset(
                        AppAssets.main_logo,
                        width: 40,
                        height: 40,
                      ),
                      HorizontalPadding(percentage: .02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? "Welcome",
                          style: appTextStyle.middleTSBasic.copyWith(
                            color: AppColors.black,
                          ),),

                          Text( name,
                          style: appTextStyle.minTSBasic.copyWith(
                            color: AppColors.black
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          SizedBox(
            width: AppDimens.space16,
          ),
        ],
      ),
    );
  }
}
