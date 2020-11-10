import 'dart:convert';

class ImageModel {
  String title;
  String url;
  String categoryId;
  String thumbs;
  String memo;
  String createTime;

  ImageModel({
    this.title,
    this.url,
    this.categoryId,
    this.thumbs,
    this.memo,
    this.createTime,
  });

  ImageModel copyWith({
    String title,
    String url,
    String categoryId,
    String thumbs,
    String memo,
    String createTime,
  }) {
    return ImageModel(
      title: title ?? this.title,
      url: url ?? this.url,
      categoryId: categoryId ?? this.categoryId,
      thumbs: thumbs ?? this.thumbs,
      memo: memo ?? this.memo,
      createTime: createTime ?? this.createTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
      'categoryId': categoryId,
      'thumbs': thumbs,
      'memo': memo,
      'createTime': createTime,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ImageModel(
      title: map['title'],
      url: map['url'],
      categoryId: map['categoryId'],
      thumbs: map['thumbs'],
      memo: map['memo'],
      createTime: map['createTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageModel(title: $title, url: $url, categoryId: $categoryId, thumbs: $thumbs, memo: $memo, createTime: $createTime)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageModel && o.title == title && o.url == url && o.categoryId == categoryId && o.thumbs == thumbs && o.memo == memo && o.createTime == createTime;
  }

  @override
  int get hashCode {
    return title.hashCode ^ url.hashCode ^ categoryId.hashCode ^ thumbs.hashCode ^ memo.hashCode ^ createTime.hashCode;
  }
}
