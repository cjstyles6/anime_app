import 'entry.dart';

class Datum {
  Entry? entry;
  String? url;
  int? votes;

  Datum({this.entry, this.url, this.votes});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        entry: json['entry'] == null
            ? null
            : Entry.fromJson(json['entry'] as Map<String, dynamic>),
        url: json['url'] as String?,
        votes: json['votes'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'entry': entry?.toJson(),
        'url': url,
        'votes': votes,
      };
}
