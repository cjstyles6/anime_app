import 'images.dart';

class Person {
  int? malId;
  String? url;
  Images? images;
  String? name;

  Person({this.malId, this.url, this.images, this.name});

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'images': images?.toJson(),
        'name': name,
      };
}
