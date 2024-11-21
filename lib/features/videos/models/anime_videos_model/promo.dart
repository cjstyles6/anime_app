import 'trailer.dart';

class Promo {
  String? title;
  Trailer? trailer;

  Promo({this.title, this.trailer});

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        title: json['title'] as String?,
        trailer: json['trailer'] == null
            ? null
            : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'trailer': trailer?.toJson(),
      };
}
