import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';

class TopLoginLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Ionicons.md_images,
          color: AppColors.white,
          size: 35,
        ),
        HorizontalPadding(
          percentage: .02,
        ),
        Text(
          "Gallery",
          style: appTextStyle.bigTSBasic
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
        )
      ],
    ));
  }
}
