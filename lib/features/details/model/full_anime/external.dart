class External {
  String? name;
  String? url;

  External({this.name, this.url});

  factory External.fromJson(Map<String, dynamic> json) => External(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
