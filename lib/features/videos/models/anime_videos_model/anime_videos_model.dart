import 'data.dart';

class AnimeVideosModel {
  Data? data;

  AnimeVideosModel({this.data});

  factory AnimeVideosModel.fromJson(Map<String, dynamic> json) {
    return AnimeVideosModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
