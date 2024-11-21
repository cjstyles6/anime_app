class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json['day'] as String?,
        time: json['time'] as String?,
        timezone: json['timezone'] as String?,
        string: json['string'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
        'timezone': timezone,
        'string': string,
      };
}
