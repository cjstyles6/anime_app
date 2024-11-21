import 'aired.dart';
import 'broadcast.dart';
import 'demographic.dart';
import 'external.dart';
import 'genre.dart';
import 'images.dart';
import 'licensor.dart';
import 'producer.dart';
import 'relation.dart';
import 'streaming.dart';
import 'studio.dart';
import 'theme.dart';
import 'title.dart';
import 'trailer.dart';

class Data {
  int? malId;
  String? url;
  Images? images;
  Trailer? trailer;
  bool? approved;
  List<Title>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Producer>? producers;
  List<Licensor>? licensors;
  List<Studio>? studios;
  List<Genre>? genres;
  List<dynamic>? explicitGenres;
  List<dynamic>? themes;
  List<Demographic>? demographics;
  List<Relation>? relations;
  Theme? theme;
  List<External>? external;
  List<Streaming>? streaming;

  Data({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
    this.relations,
    this.theme,
    this.external,
    this.streaming,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        trailer: json['trailer'] == null
            ? null
            : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
        approved: json['approved'] as bool?,
        titles: (json['titles'] as List<dynamic>?)
            ?.map((e) => Title.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
        titleEnglish: json['title_english'] as String?,
        titleJapanese: json['title_japanese'] as String?,
        titleSynonyms: json['title_synonyms'] as List<String>?,
        type: json['type'] as String?,
        source: json['source'] as String?,
        episodes: json['episodes'] as int?,
        status: json['status'] as String?,
        airing: json['airing'] as bool?,
        aired: json['aired'] == null
            ? null
            : Aired.fromJson(json['aired'] as Map<String, dynamic>),
        duration: json['duration'] as String?,
        rating: json['rating'] as String?,
        score: (json['score'] as num?)?.toDouble(),
        scoredBy: json['scored_by'] as int?,
        rank: json['rank'] as int?,
        popularity: json['popularity'] as int?,
        members: json['members'] as int?,
        favorites: json['favorites'] as int?,
        synopsis: json['synopsis'] as String?,
        background: json['background'] as String?,
        season: json['season'] as String?,
        year: json['year'] as int?,
        broadcast: json['broadcast'] == null
            ? null
            : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
        producers: (json['producers'] as List<dynamic>?)
            ?.map((e) => Producer.fromJson(e as Map<String, dynamic>))
            .toList(),
        licensors: (json['licensors'] as List<dynamic>?)
            ?.map((e) => Licensor.fromJson(e as Map<String, dynamic>))
            .toList(),
        studios: (json['studios'] as List<dynamic>?)
            ?.map((e) => Studio.fromJson(e as Map<String, dynamic>))
            .toList(),
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList(),
        explicitGenres: json['explicit_genres'] as List<dynamic>?,
        themes: json['themes'] as List<dynamic>?,
        demographics: (json['demographics'] as List<dynamic>?)
            ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
            .toList(),
        relations: (json['relations'] as List<dynamic>?)
            ?.map((e) => Relation.fromJson(e as Map<String, dynamic>))
            .toList(),
        theme: json['theme'] == null
            ? null
            : Theme.fromJson(json['theme'] as Map<String, dynamic>),
        external: (json['external'] as List<dynamic>?)
            ?.map((e) => External.fromJson(e as Map<String, dynamic>))
            .toList(),
        streaming: (json['streaming'] as List<dynamic>?)
            ?.map((e) => Streaming.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'images': images?.toJson(),
        'trailer': trailer?.toJson(),
        'approved': approved,
        'titles': titles?.map((e) => e.toJson()).toList(),
        'title': title,
        'title_english': titleEnglish,
        'title_japanese': titleJapanese,
        'title_synonyms': titleSynonyms,
        'type': type,
        'source': source,
        'episodes': episodes,
        'status': status,
        'airing': airing,
        'aired': aired?.toJson(),
        'duration': duration,
        'rating': rating,
        'score': score,
        'scored_by': scoredBy,
        'rank': rank,
        'popularity': popularity,
        'members': members,
        'favorites': favorites,
        'synopsis': synopsis,
        'background': background,
        'season': season,
        'year': year,
        'broadcast': broadcast?.toJson(),
        'producers': producers?.map((e) => e.toJson()).toList(),
        'licensors': licensors?.map((e) => e.toJson()).toList(),
        'studios': studios?.map((e) => e.toJson()).toList(),
        'genres': genres?.map((e) => e.toJson()).toList(),
        'explicit_genres': explicitGenres,
        'themes': themes,
        'demographics': demographics?.map((e) => e.toJson()).toList(),
        'relations': relations?.map((e) => e.toJson()).toList(),
        'theme': theme?.toJson(),
        'external': external?.map((e) => e.toJson()).toList(),
        'streaming': streaming?.map((e) => e.toJson()).toList(),
      };
}
