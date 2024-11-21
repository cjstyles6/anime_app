import 'items.dart';

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json['last_visible_page'] as int?,
        hasNextPage: json['has_next_page'] as bool?,
        currentPage: json['current_page'] as int?,
        items: json['items'] == null
            ? null
            : Items.fromJson(json['items'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'last_visible_page': lastVisiblePage,
        'has_next_page': hasNextPage,
        'current_page': currentPage,
        'items': items?.toJson(),
      };
}
