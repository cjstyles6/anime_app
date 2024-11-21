import 'images.dart';

class Entry {
  int? malId;
  String? url;
  Images? images;
  String? title;

  Entry({this.malId, this.url, this.images, this.title});

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'images': images?.toJson(),
        'title': title,
      };
}
