import 'entry.dart';
import 'episode.dart';

class Datum {
  Entry? entry;
  List<Episode>? episodes;
  bool? regionLocked;

  Datum({this.entry, this.episodes, this.regionLocked});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        entry: json['entry'] == null
            ? null
            : Entry.fromJson(json['entry'] as Map<String, dynamic>),
        episodes: (json['episodes'] as List<dynamic>?)
            ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
            .toList(),
        regionLocked: json['region_locked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'entry': entry?.toJson(),
        'episodes': episodes?.map((e) => e.toJson()).toList(),
        'region_locked': regionLocked,
      };
}
