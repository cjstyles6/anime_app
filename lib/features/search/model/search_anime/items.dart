class Items {
  int? count;
  int? total;
  int? perPage;

  Items({this.count, this.total, this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json['count'] as int?,
        total: json['total'] as int?,
        perPage: json['per_page'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'total': total,
        'per_page': perPage,
      };
}
