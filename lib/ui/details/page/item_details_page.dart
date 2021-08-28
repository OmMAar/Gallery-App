import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nabed_test/common/animation/animation_column_widget.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/ui/home/widgets/home_app_bar_widget.dart';
import 'package:nabed_test/utils/device/device_utils.dart';
import 'package:nabed_test/widgets/image/image_caching_widget.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HitsModel;
    AppBar appBar = AppBar(
      backgroundColor: AppColors.white,
      title: HomeAppBarWidget(
        name: args.user ?? "",
        title: "posted by",
        image: ImageCacheWidget(
          imageUrl: args.userImageURL ?? '',
          imageHeight: 35,
          imageWidth: 35,
          imageBorderRadius: 35,
        ),
      ),
      brightness: Brightness.light,
      elevation: 0,
      actions: [
        HorizontalPadding(
          percentage: 0.05,
        )
      ],
    );

    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.white,
      body: Container(
        width: widthC,
        height: heightC,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.space6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalPadding(
                  percentage: 0.01,
                ),
                _buildTopSection(args: args, width: widthC, height: heightC),
                VerticalPadding(
                  percentage: 0.05,
                ),
                _buildTagChipsWidget(widthC, _getListOfTags(args.tags ?? '')),
                Divider(),
                VerticalPadding(
                  percentage: 0.05,
                ),
                Container(
                  child: Text(
                    'Item info:',
                    style: appTextStyle.bigTSBasic.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalPadding(
                  percentage: 0.05,
                ),
                _buildItemInfo(args: args, width: widthC)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTopSection(
      {required HitsModel args,
      required double width,
      required double height}) {
    return Container(
      height: height * .35,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.06))),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ZoomIn(
            child: ImageCacheWidget(
              imageUrl: args.previewURL ?? '',
              imageHeight: height * .35,
              imageWidth: width,
              imageBorderRadius: width * 0.06,
            ),
          ),
          Positioned(
            bottom: 0,
            child: FadeInUp(
              delay: Duration(milliseconds: 1000),
              duration: Duration(milliseconds: 1000),
              child: Container(
                width: width,
                color: AppColors.white.withOpacity(0.6),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppDimens.space24,
                      right: AppDimens.space24,
                      top: AppDimens.space6,
                      bottom: AppDimens.space6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildItemWithIcon(
                          iconData: AntDesign.eyeo,
                          title: args.views.toString(),
                          iconColor: AppColors.white),
                      HorizontalPadding(
                        percentage: 0.04,
                      ),
                      _buildItemWithIcon(
                          iconData: AntDesign.hearto,
                          title: args.likes.toString(),
                          iconColor: AppColors.white),
                      HorizontalPadding(
                        percentage: 0.04,
                      ),
                      _buildItemWithIcon(
                          iconData: FontAwesome.comments_o,
                          title: args.comments.toString(),
                          iconColor: AppColors.white),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildItemWithIcon(
      {required IconData iconData,
      double size = 20,
      TextStyle? textStyle,
      Color? iconColor,
      required String title}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            child: FittedBox(
              child: Center(
                child: Icon(
                  iconData,
                  size: size,
                  color: iconColor ?? AppColors.mainGray,
                ),
              ),
            ),
          ),
          HorizontalPadding(
            percentage: .012,
          ),
          Text(
            title,
            style: textStyle ??
                appTextStyle.minTSBasic.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _buildColumnItemWithIcon(
      {required IconData iconData, double width = 20, required String title}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.mainGray.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2.0, color: AppColors.mainColor)),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              child: Center(
                child: Icon(
                  iconData,
                  size: 50,
                  color: AppColors.white,
                ),
              ),
            ),
            VerticalPadding(
              percentage: .02,
            ),
            Text(
              title,
              style: appTextStyle.middleTSBasic.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  List<String> _getListOfTags(String tags) {
    if (tags != null && tags.isNotEmpty) {
      String s = tags;
      int idx = tags.indexOf(",");
      List<String> parts = tags.split(",");
      print("length :${parts.length}");
      return parts;
    }
    return [];
  }

  _buildTagChipsWidget(double width, List<String> tags) {
    Wrap body = new Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: []);

    body.children.addAll(tags.map((item) {
      return _buildItemAnimated(
          title: item,
          delay: Duration(milliseconds: (tags.indexOf(item) + 2) * 200),
          width: width);
    }));
    return Container(width: width, child: body);
  }

  Widget _buildItemAnimated(
      {required String title, required Duration delay, required double width}) {
    return FadeInLeft(
        delay: delay,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(width * .06)),
              color: AppColors.mainColor.withOpacity(.8)),
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space20, vertical: AppDimens.space8),
          margin: EdgeInsets.all(AppDimens.space2),
          child: Text(
            title.trim(),
            style: appTextStyle.middleTSBasic.copyWith(color: AppColors.white),
          ),
        ));
  }

  _buildItemInfo({required HitsModel args, required double width}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppDimens.space10, right: AppDimens.space10),
        child: AnimationColumnWidget(
          crossAxisAlignment: CrossAxisAlignment.start,
          duration: Duration(milliseconds: 750),
          // delay: Duration(milliseconds: 250),
          horizontalOffset: 50,
          children: [
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: Octicons.file_media,
                          title: args.type ?? "",
                          width: width)),
                  HorizontalPadding(
                    percentage: .1,
                  ),
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: AntDesign.download,
                          title: args.downloads.toString(),
                          width: width)),
                ],
              ),
            ),
            VerticalPadding(
              percentage: 0.04,
            ),
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: MaterialIcons.collections,
                          title: args.collections.toString(),
                          width: width)),
                  HorizontalPadding(
                    percentage: .1,
                  ),
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: FontAwesome.arrows_h,
                          title: args.imageWidth.toString(),
                          width: width)),
                ],
              ),
            ),

            VerticalPadding(
              percentage: 0.04,
            ),
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: FontAwesome.arrows_v,
                          title: args.imageHeight.toString(),
                          width: width)),
                  HorizontalPadding(
                    percentage: .1,
                  ),
                  Expanded(
                      child: _buildColumnItemWithIcon(
                          iconData: MaterialIcons.photo_size_select_large,
                          title: args.imageSize.toString(),
                          width: width)),
                ],
              ),
            ),


            VerticalPadding(
              percentage: 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
