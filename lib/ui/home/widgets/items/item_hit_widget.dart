import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/constants/app_dimens.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/utils/routes/routes.dart';
import 'package:nabed_test/widgets/image/image_caching_widget.dart';

class ItemHitWidget extends StatelessWidget {
  final double width;
  final HitsModel item;
  const ItemHitWidget({Key? key,required this.width,required this.item});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.itemDetailsPage,arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.space8),
        width: width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
            side: BorderSide(
              width: 2.0,
              color: AppColors.mainColor
            )
          ),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.space6),
            child: Container(
              width: width,
              height: 200,
              child: ImageCacheWidget(
                imageUrl: item.previewURL!,
                imageHeight: 200,
                imageWidth: width,
                imageBorderRadius: width * 0.02,
                placeHolder: SpinKitPulse(
                  color: AppColors.mainColor,
                  size: width * .2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
