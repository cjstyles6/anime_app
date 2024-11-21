import 'datum.dart';

class CharactersModel {
  List<Datum>? data;

  CharactersModel({this.data});

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
