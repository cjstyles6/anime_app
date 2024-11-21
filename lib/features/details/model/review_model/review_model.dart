// review_model.dart
class ReviewModel {
  Pagination? pagination;
  List<ReviewDatum>? data;

  ReviewModel({this.pagination, this.data});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ReviewDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

// review_datum.dart
class ReviewDatum {
  int? malId;
  String? url;
  String? type;
  Map<String, dynamic>? reactions;
  DateTime? date;
  String? review;
  int? score;
  List<String>? tags;
  bool? isSpoiler;
  bool? isPreliminary;
  int? episodesWatched;
  ReviewUser? user;

  ReviewDatum({
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

  factory ReviewDatum.fromJson(Map<String, dynamic> json) => ReviewDatum(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        type: json['type'] as String?,
        reactions: json['reactions'] as Map<String, dynamic>?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        review: json['review'] as String?,
        score: json['score'] as int?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
        isSpoiler: json['is_spoiler'] as bool?,
        isPreliminary: json['is_preliminary'] as bool?,
        episodesWatched: json['episodes_watched'] as int?,
        user: json['user'] == null
            ? null
            : ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'type': type,
        'reactions': reactions,
        'date': date?.toIso8601String(),
        'review': review,
        'score': score,
        'tags': tags,
        'is_spoiler': isSpoiler,
        'is_preliminary': isPreliminary,
        'episodes_watched': episodesWatched,
        'user': user?.toJson(),
      };
}

// review_user.dart
class ReviewUser {
  String? url;
  String? username;
  UserImages? images;

  ReviewUser({
    this.url,
    this.username,
    this.images,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) => ReviewUser(
        url: json['url'] as String?,
        username: json['username'] as String?,
        images: json['images'] == null
            ? null
            : UserImages.fromJson(json['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'username': username,
        'images': images?.toJson(),
      };
}

// user_images.dart
class UserImages {
  ImageFormat? jpg;
  ImageFormat? webp;

  UserImages({
    this.jpg,
    this.webp,
  });

  factory UserImages.fromJson(Map<String, dynamic> json) => UserImages(
        jpg: json['jpg'] == null
            ? null
            : ImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
        webp: json['webp'] == null
            ? null
            : ImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'jpg': jpg?.toJson(),
        'webp': webp?.toJson(),
      };
}

// image_format.dart
class ImageFormat {
  String? imageUrl;

  ImageFormat({
    this.imageUrl,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) => ImageFormat(
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
      };
}

// pagination.dart
class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json['last_visible_page'] as int?,
        hasNextPage: json['has_next_page'] as bool?,
        currentPage: json['current_page'] as int?,
        items: json['items'] == null
            ? null
            : Items.fromJson(json['items'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'last_visible_page': lastVisiblePage,
        'has_next_page': hasNextPage,
        'current_page': currentPage,
        'items': items?.toJson(),
      };
}

// items.dart
class Items {
  int? count;
  int? total;
  int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json['count'] as int?,
        total: json['total'] as int?,
        perPage: json['per_page'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'total': total,
        'per_page': perPage,
      };
}
