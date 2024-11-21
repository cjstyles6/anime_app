class To {
  int? day;
  int? month;
  int? year;

  To({this.day, this.month, this.year});

  factory To.fromJson(Map<String, dynamic> json) => To(
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
