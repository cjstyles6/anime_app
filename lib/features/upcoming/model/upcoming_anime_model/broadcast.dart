class Broadcast {
  dynamic day;
  dynamic time;
  dynamic timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json['day'] as dynamic,
        time: json['time'] as dynamic,
        timezone: json['timezone'] as dynamic,
        string: json['string'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
        'timezone': timezone,
        'string': string,
      };
}
