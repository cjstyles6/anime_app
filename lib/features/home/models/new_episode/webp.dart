class Webp {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Webp({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json['image_url'] as String?,
        smallImageUrl: json['small_image_url'] as String?,
        largeImageUrl: json['large_image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
        'small_image_url': smallImageUrl,
        'large_image_url': largeImageUrl,
      };
}
