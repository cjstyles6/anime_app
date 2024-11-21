class To {
  dynamic day;
  dynamic month;
  dynamic year;

  To({this.day, this.month, this.year});

  factory To.fromJson(Map<String, dynamic> json) => To(
        day: json['day'] as dynamic,
        month: json['month'] as dynamic,
        year: json['year'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'year': year,
      };
}
