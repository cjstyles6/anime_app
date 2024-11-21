class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json['day'] as int?,
        month: json['month'] as int?,
        year: json['year'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'year': year,
      };
}
