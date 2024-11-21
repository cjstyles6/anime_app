import 'entry.dart';
import 'user.dart';

class Datum {
  String? malId;
  List<Entry>? entry;
  String? content;
  String? date;
  User? user;

  Datum({this.malId, this.entry, this.content, this.date, this.user});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json['mal_id'] as String?,
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
        content: json['content'] as String?,
        date: json['date'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'entry': entry?.map((e) => e.toJson()).toList(),
        'content': content,
        'date': date,
        'user': user?.toJson(),
      };
}
