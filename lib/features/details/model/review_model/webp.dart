class Webp {
  String? imageUrl;

  Webp({this.imageUrl});

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
      };
}
