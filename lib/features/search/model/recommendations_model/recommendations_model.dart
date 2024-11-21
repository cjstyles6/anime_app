import 'datum.dart';
import 'pagination.dart';

class RecommendationsModel {
  Pagination? pagination;
  List<Datum>? data;

  RecommendationsModel({this.pagination, this.data});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
