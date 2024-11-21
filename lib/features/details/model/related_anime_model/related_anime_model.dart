import 'datum.dart';

class RelatedAnimeModel {
  List<Datum>? data;

  RelatedAnimeModel({this.data});

  factory RelatedAnimeModel.fromJson(Map<String, dynamic> json) {
    return RelatedAnimeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
