import 'jpg.dart';

class Images {
  Jpg? jpg;

  Images({this.jpg});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: json['jpg'] == null
            ? null
            : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'jpg': jpg?.toJson(),
      };
}
