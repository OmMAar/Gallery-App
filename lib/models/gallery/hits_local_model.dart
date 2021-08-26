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

  static final String id = '_id';
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

class HitsLocalModel {
  int? id;
  int? mainId;
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

  HitsLocalModel(
      {this.id,
      this.pageURL,
      this.mainId,
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

  HitsLocalModel copy({
    int? id,
    int? mainId,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageURL,
  }) =>
      HitsLocalModel(
        id: id ?? this.id,
        webformatWidth: webformatWidth ?? this.webformatWidth,
        webformatURL: webformatURL ?? this.webformatURL,
        webformatHeight: webformatHeight ?? this.webformatHeight,
        views: views ?? this.views,
        userImageURL: userImageURL ?? this.userImageURL,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        tags: tags ?? this.tags,
        previewWidth: previewWidth ?? this.previewWidth,
        previewURL: previewURL ?? this.previewURL,
        previewHeight: previewHeight ?? this.previewHeight,
        pageURL: pageURL ?? this.pageURL,
        likes: likes ?? this.likes,
        largeImageURL: largeImageURL ?? this.largeImageURL,
        imageSize: imageSize ?? this.imageSize,
        downloads: downloads ?? this.downloads,
        comments: comments ?? this.comments,
        type: type ?? this.type,
        imageWidth: imageWidth ?? this.imageWidth,
        imageHeight: imageHeight ?? this.imageHeight,
        collections: collections ?? this.collections,
        mainId: mainId ?? this.mainId,
      );

  static HitsLocalModel fromJson(Map<String, Object?> json) => HitsLocalModel(
        id: json[ItemFields.id] as int?,
        mainId: json[ItemFields.mainId] as int?,
        type: json[ItemFields.type] as String?,
        imageWidth: json[ItemFields.imageWidth] as int?,
        imageHeight: json[ItemFields.imageHeight] as int?,
        collections: json[ItemFields.collections] as int?,
        comments: json[ItemFields.comments] as int?,
        downloads: json[ItemFields.downloads] as int?,
        imageSize: json[ItemFields.imageSize] as int?,
        largeImageURL: json[ItemFields.largeImageURL] as String?,
        likes: json[ItemFields.likes] as int?,
        pageURL: json[ItemFields.pageURL] as String?,
        previewHeight: json[ItemFields.previewHeight] as int?,
        previewURL: json[ItemFields.previewURL] as String?,
        previewWidth: json[ItemFields.previewWidth] as int?,
        tags: json[ItemFields.tags] as String?,
        user: json[ItemFields.user] as String?,
        userId: json[ItemFields.userId] as int?,
        userImageURL: json[ItemFields.userImageURL] as String?,
        views: json[ItemFields.views] as int?,
        webformatHeight: json[ItemFields.webformatHeight] as int?,
        webformatURL: json[ItemFields.webformatURL] as String?,
        webformatWidth: json[ItemFields.webformatWidth] as int?,
      );

  Map<String, Object?> toJson() => {
        ItemFields.id: id,
        ItemFields.mainId: mainId,
        ItemFields.pageURL: pageURL,
        ItemFields.type: type,
        ItemFields.tags: tags,
        ItemFields.previewURL: previewURL,
        ItemFields.previewWidth: previewWidth,
        ItemFields.previewHeight: previewHeight,
        ItemFields.webformatURL: webformatURL,
        ItemFields.webformatWidth: webformatWidth,
        ItemFields.webformatHeight: webformatHeight,
        ItemFields.largeImageURL: largeImageURL,
        ItemFields.imageWidth: imageWidth,
        ItemFields.imageHeight: imageHeight,
        ItemFields.imageSize: imageSize,
        ItemFields.views: views,
        ItemFields.downloads: downloads,
        ItemFields.collections: collections,
        ItemFields.likes: likes,
        ItemFields.comments: comments,
        ItemFields.userId: userId,
        ItemFields.user: user,
        ItemFields.userImageURL: userImageURL,
      };
}
