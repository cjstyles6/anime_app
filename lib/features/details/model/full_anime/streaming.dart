class Streaming {
  String? name;
  String? url;

  Streaming({this.name, this.url});

  factory Streaming.fromJson(Map<String, dynamic> json) => Streaming(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
