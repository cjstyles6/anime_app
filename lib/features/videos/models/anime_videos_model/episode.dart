import 'images.dart';

class Episode {
  int? malId;
  String? title;
  String? episode;
  String? url;
  Images? images;

  Episode({this.malId, this.title, this.episode, this.url, this.images});

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        malId: json['mal_id'] as int?,
        title: json['title'] as String?,
        episode: json['episode'] as String?,
        url: json['url'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'title': title,
        'episode': episode,
        'url': url,
        'images': images?.toJson(),
      };
}
