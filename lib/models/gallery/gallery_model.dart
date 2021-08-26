import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';




@JsonSerializable()
class GalleryModel {
  int? total;
  int? totalHits;
  List<HitsModel>? hits;

  GalleryModel({this.total, this.totalHits, this.hits});

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);

}

@JsonSerializable()
class HitsModel {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  int? previewWidth;
  int? previewHeight;
  String? webformatURL;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageURL;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageURL;

  HitsModel(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.collections,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL});

  factory HitsModel.fromJson(Map<String, dynamic> json) =>
      _$HitsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HitsModelToJson(this);


}
