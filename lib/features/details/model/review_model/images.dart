import 'jpg.dart';
import 'webp.dart';

class Images {
  Jpg? jpg;
  Webp? webp;

  Images({this.jpg, this.webp});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: json['jpg'] == null
            ? null
            : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
        webp: json['webp'] == null
            ? null
            : Webp.fromJson(json['webp'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'jpg': jpg?.toJson(),
        'webp': webp?.toJson(),
      };
}
