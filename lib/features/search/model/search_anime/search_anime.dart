import 'datum.dart';
import 'pagination.dart';

class SearchAnimeModel {
  Pagination? pagination;
  List<Datum>? data;

  SearchAnimeModel({this.pagination, this.data});

  factory SearchAnimeModel.fromJson(Map<String, dynamic> json) =>
      SearchAnimeModel(
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
