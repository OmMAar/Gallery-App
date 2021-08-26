// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) {
  return GalleryModel(
    total: json['total'] as int?,
    totalHits: json['totalHits'] as int?,
    hits: (json['hits'] as List<dynamic>?)
        ?.map((e) => HitsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };

HitsModel _$HitsModelFromJson(Map<String, dynamic> json) {
  return HitsModel(
    id: json['id'] as int?,
    pageURL: json['pageURL'] as String?,
    type: json['type'] as String?,
    tags: json['tags'] as String?,
    previewURL: json['previewURL'] as String?,
    previewWidth: json['previewWidth'] as int?,
    previewHeight: json['previewHeight'] as int?,
    webformatURL: json['webformatURL'] as String?,
    webformatWidth: json['webformatWidth'] as int?,
    webformatHeight: json['webformatHeight'] as int?,
    largeImageURL: json['largeImageURL'] as String?,
    imageWidth: json['imageWidth'] as int?,
    imageHeight: json['imageHeight'] as int?,
    imageSize: json['imageSize'] as int?,
    views: json['views'] as int?,
    downloads: json['downloads'] as int?,
    collections: json['collections'] as int?,
    likes: json['likes'] as int?,
    comments: json['comments'] as int?,
    userId: json['userId'] as int?,
    user: json['user'] as String?,
    userImageURL: json['userImageURL'] as String?,
  );
}

Map<String, dynamic> _$HitsModelToJson(HitsModel instance) => <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'userId': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };
