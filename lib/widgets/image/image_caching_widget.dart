import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nabed_test/constants/app_constants.dart';

class ImageCacheWidget extends StatefulWidget {
  final String imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final double? imageBorderRadius;
  final bool imageBorderRadiusTopLeft;
  final bool imageBorderRadiusTopRight;
  final bool imageBorderRadiusBottomLeft;
  final bool imageBorderRadiusBottomRight;
  final bool isCache;
  final BoxFit boxFit;
  final Widget? placeHolder;
  final Widget? errorWidget;

  const ImageCacheWidget({
    this.boxFit = BoxFit.cover,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.placeHolder,
    this.errorWidget,
    this.isCache = false,
    this.imageBorderRadius = 0.0,
    this.imageBorderRadiusTopLeft = true,
    this.imageBorderRadiusTopRight = true,
    this.imageBorderRadiusBottomLeft = true,
    this.imageBorderRadiusBottomRight = true,
  });

  @override
  _CustomImageDemoState createState() => _CustomImageDemoState();
}

class _CustomImageDemoState extends State<ImageCacheWidget>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ImageCacheWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            widget.imageBorderRadiusTopLeft ? widget.imageBorderRadius! : 0.0,
          ),
          topRight: Radius.circular(
            widget.imageBorderRadiusTopRight ? widget.imageBorderRadius! : 0.0,
          ),
          bottomLeft: Radius.circular(
            widget.imageBorderRadiusBottomLeft
                ? widget.imageBorderRadius!
                : 0.0,
          ),
          bottomRight: Radius.circular(
            widget.imageBorderRadiusBottomRight
                ? widget.imageBorderRadius!
                : 0.0,
          ),
        ),
        child: Container(
            width: widget.imageWidth,
            height: widget.imageHeight,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              height: widget.imageHeight,
              width: widget.imageWidth,
              fadeOutDuration: Duration(milliseconds: 500),
              fadeInCurve: Curves.easeInOut,
              fadeInDuration: Duration(milliseconds: 500),
              fadeOutCurve: Curves.easeInOut,
              fit: widget.boxFit,
              placeholder: (context, _) {
                return  Container(
                    height: widget.imageHeight,
                    width: widget.imageWidth,
                    child: widget.placeHolder ?? Image.asset(
                      AppAssets.place_holder,
                      fit: BoxFit.fill,
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                    ));
              },
              errorWidget: (context, url, error) => Container(
                width: widget.imageWidth,
                height: widget.imageHeight,
                child: widget.errorWidget ??  Image.asset(
                  AppAssets.place_holder,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                  fit: BoxFit.fill,
                ),
              ),
            )));
  }

  @override
  bool get wantKeepAlive => true;
}
