class FullAnimeModel {
  Data? data;

  FullAnimeModel({this.data});

  factory FullAnimeModel.fromJson(Map<String, dynamic> json) => FullAnimeModel(
        data: json['data'] == null ? null : Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}

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
  List<Producer>? licensors;
  List<Producer>? studios;
  List<Genre>? genres;
  List<Genre>? themes;
  List<Genre>? demographics;

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
    this.themes,
    this.demographics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        malId: json['mal_id'],
        url: json['url'],
        images: json['images'] == null ? null : Images.fromJson(json['images']),
        trailer:
            json['trailer'] == null ? null : Trailer.fromJson(json['trailer']),
        approved: json['approved'],
        titles: json['titles'] == null
            ? []
            : List<Title>.from(json['titles'].map((x) => Title.fromJson(x))),
        title: json['title'],
        titleEnglish: json['title_english'],
        titleJapanese: json['title_japanese'],
        titleSynonyms: json['title_synonyms'] == null
            ? []
            : List<String>.from(
                json['title_synonyms'].map((x) => x.toString())),
        type: json['type'],
        source: json['source'],
        episodes: json['episodes'],
        status: json['status'],
        airing: json['airing'],
        aired: json['aired'] == null ? null : Aired.fromJson(json['aired']),
        duration: json['duration'],
        rating: json['rating'],
        score: json['score']?.toDouble(),
        scoredBy: json['scored_by'],
        rank: json['rank'],
        popularity: json['popularity'],
        members: json['members'],
        favorites: json['favorites'],
        synopsis: json['synopsis'],
        background: json['background'],
        season: json['season'],
        year: json['year'],
        broadcast: json['broadcast'] == null
            ? null
            : Broadcast.fromJson(json['broadcast']),
        producers: json['producers'] == null
            ? []
            : List<Producer>.from(
                json['producers'].map((x) => Producer.fromJson(x))),
        licensors: json['licensors'] == null
            ? []
            : List<Producer>.from(
                json['licensors'].map((x) => Producer.fromJson(x))),
        studios: json['studios'] == null
            ? []
            : List<Producer>.from(
                json['studios'].map((x) => Producer.fromJson(x))),
        genres: json['genres'] == null
            ? []
            : List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
        themes: json['themes'] == null
            ? []
            : List<Genre>.from(json['themes'].map((x) => Genre.fromJson(x))),
        demographics: json['demographics'] == null
            ? []
            : List<Genre>.from(
                json['demographics'].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'images': images?.toJson(),
        'trailer': trailer?.toJson(),
        'approved': approved,
        'titles': titles?.map((x) => x.toJson()).toList(),
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
        'producers': producers?.map((x) => x.toJson()).toList(),
        'licensors': licensors?.map((x) => x.toJson()).toList(),
        'studios': studios?.map((x) => x.toJson()).toList(),
        'genres': genres?.map((x) => x.toJson()).toList(),
        'themes': themes?.map((x) => x.toJson()).toList(),
        'demographics': demographics?.map((x) => x.toJson()).toList(),
      };
}

class Aired {
  DateTime? from;
  DateTime? to;
  Prop? prop;
  String? string;

  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json['from'] == null ? null : DateTime.parse(json['from']),
        to: json['to'] == null ? null : DateTime.parse(json['to']),
        prop: json['prop'] == null ? null : Prop.fromJson(json['prop']),
        string: json['string'],
      );

  Map<String, dynamic> toJson() => {
        'from': from?.toIso8601String(),
        'to': to?.toIso8601String(),
        'prop': prop?.toJson(),
        'string': string,
      };
}

class Prop {
  From? from;
  From? to;

  Prop({
    this.from,
    this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json['from'] == null ? null : From.fromJson(json['from']),
        to: json['to'] == null ? null : From.fromJson(json['to']),
      );

  Map<String, dynamic> toJson() => {
        'from': from?.toJson(),
        'to': to?.toJson(),
      };
}

class From {
  int? day;
  int? month;
  int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json['day'],
        month: json['month'],
        year: json['year'],
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'year': year,
      };
}

class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json['day'],
        time: json['time'],
        timezone: json['timezone'],
        string: json['string'],
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
        'timezone': timezone,
        'string': string,
      };
}

class Genre {
  int? malId;
  String? type;
  String? name;
  String? url;

  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        malId: json['mal_id'],
        type: json['type'],
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'type': type,
        'name': name,
        'url': url,
      };
}

class Images {
  Jpg? jpg;
  Jpg? webp;

  Images({
    this.jpg,
    this.webp,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: json['jpg'] == null ? null : Jpg.fromJson(json['jpg']),
        webp: json['webp'] == null ? null : Jpg.fromJson(json['webp']),
      );

  Map<String, dynamic> toJson() => {
        'jpg': jpg?.toJson(),
        'webp': webp?.toJson(),
      };
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json['image_url'],
        smallImageUrl: json['small_image_url'],
        largeImageUrl: json['large_image_url'],
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
        'small_image_url': smallImageUrl,
        'large_image_url': largeImageUrl,
      };
}

class Producer {
  int? malId;
  String? type;
  String? name;
  String? url;

  Producer({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Producer.fromJson(Map<String, dynamic> json) => Producer(
        malId: json['mal_id'],
        type: json['type'],
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'type': type,
        'name': name,
        'url': url,
      };
}

class Title {
  String? type;
  String? title;

  Title({
    this.type,
    this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json['type'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
      };
}

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json['youtube_id'],
        url: json['url'],
        embedUrl: json['embed_url'],
      );

  Map<String, dynamic> toJson() => {
        'youtube_id': youtubeId,
        'url': url,
        'embed_url': embedUrl,
      };
}
