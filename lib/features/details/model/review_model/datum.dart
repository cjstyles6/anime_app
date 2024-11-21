import 'reactions.dart';
import 'user.dart';

class Datum {
  int? malId;
  String? url;
  String? type;
  Reactions? reactions;
  String? date;
  String? review;
  int? score;
  List<String>? tags;
  bool? isSpoiler;
  bool? isPreliminary;
  dynamic episodesWatched;
  User? user;

  Datum({
    this.malId,
    this.url,
    this.type,
    this.reactions,
    this.date,
    this.review,
    this.score,
    this.tags,
    this.isSpoiler,
    this.isPreliminary,
    this.episodesWatched,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        type: json['type'] as String?,
        reactions: json['reactions'] == null
            ? null
            : Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
        date: json['date'] as String?,
        review: json['review'] as String?,
        score: json['score'] as int?,
        tags: json['tags'] as List<String>?,
        isSpoiler: json['is_spoiler'] as bool?,
        isPreliminary: json['is_preliminary'] as bool?,
        episodesWatched: json['episodes_watched'] as dynamic,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'type': type,
        'reactions': reactions?.toJson(),
        'date': date,
        'review': review,
        'score': score,
        'tags': tags,
        'is_spoiler': isSpoiler,
        'is_preliminary': isPreliminary,
        'episodes_watched': episodesWatched,
        'user': user?.toJson(),
      };
}
