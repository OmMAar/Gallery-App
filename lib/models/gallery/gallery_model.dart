import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';


class ItemFields {
  static final List<String> values = [
    /// Add all fields
    id,
    mainId,
    pageURL,
    type,
    tags,
    previewURL,
    previewWidth,
    previewHeight,
    webformatURL,
    webformatWidth,
    webformatHeight,
    largeImageURL,
    imageWidth,
    imageHeight,
    imageSize,
    views,
    downloads,
    collections,
    likes,
    comments,
    userId,
    user,
    userImageURL,
  ];

  static final String id = 'id';
  static final String mainId = 'mainId';
  static final String pageURL = 'pageURL';
  static final String type = 'type';
  static final String tags = 'tags';
  static final String previewURL = 'previewURL';

  static final String previewWidth = 'previewWidth';
  static final String previewHeight = 'previewHeight';
  static final String webformatURL = 'webformatURL';

  static final String webformatWidth = 'webformatWidth';
  static final String webformatHeight = 'webformatHeight';
  static final String largeImageURL = 'largeImageURL';
  static final String imageWidth = 'imageWidth';
  static final String imageHeight = 'imageHeight';
  static final String imageSize = 'imageSize';
  static final String views = 'views';
  static final String downloads = 'downloads';
  static final String collections = 'collections';
  static final String likes = 'likes';
  static final String comments = 'comments';
  static final String userId = 'userId';
  static final String user = 'user';
  static final String userImageURL = 'userImageURL';
}

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
