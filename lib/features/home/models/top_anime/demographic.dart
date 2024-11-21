class Demographic {
  int? malId;
  String? type;
  String? name;
  String? url;

  Demographic({this.malId, this.type, this.name, this.url});

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json['mal_id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'type': type,
        'name': name,
        'url': url,
      };
}
