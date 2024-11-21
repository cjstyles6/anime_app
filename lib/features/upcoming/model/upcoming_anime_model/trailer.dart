import 'images.dart';

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  Images? images;

  Trailer({this.youtubeId, this.url, this.embedUrl, this.images});

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json['youtube_id'] as String?,
        url: json['url'] as String?,
        embedUrl: json['embed_url'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'youtube_id': youtubeId,
        'url': url,
        'embed_url': embedUrl,
        'images': images?.toJson(),
      };
}
