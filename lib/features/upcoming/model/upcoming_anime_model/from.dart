class From {
  dynamic day;
  dynamic month;
  dynamic year;

  From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => From(
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
