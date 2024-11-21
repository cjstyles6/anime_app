import 'episode.dart';
import 'promo.dart';

class Data {
  List<Promo>? promo;
  List<Episode>? episodes;
  List<dynamic>? musicVideos;

  Data({this.promo, this.episodes, this.musicVideos});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        promo: (json['promo'] as List<dynamic>?)
            ?.map((e) => Promo.fromJson(e as Map<String, dynamic>))
            .toList(),
        episodes: (json['episodes'] as List<dynamic>?)
            ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
            .toList(),
        musicVideos: json['music_videos'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'promo': promo?.map((e) => e.toJson()).toList(),
        'episodes': episodes?.map((e) => e.toJson()).toList(),
        'music_videos': musicVideos,
      };
}
