class Episode {
  int? malId;
  String? url;
  String? title;
  bool? premium;

  Episode({this.malId, this.url, this.title, this.premium});

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        malId: json['mal_id'] as int?,
        url: json['url'] as String?,
        title: json['title'] as String?,
        premium: json['premium'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'url': url,
        'title': title,
        'premium': premium,
      };
}
