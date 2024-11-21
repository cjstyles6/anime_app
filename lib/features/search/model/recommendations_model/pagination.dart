class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;

  Pagination({this.lastVisiblePage, this.hasNextPage});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json['last_visible_page'] as int?,
        hasNextPage: json['has_next_page'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'last_visible_page': lastVisiblePage,
        'has_next_page': hasNextPage,
      };
}
