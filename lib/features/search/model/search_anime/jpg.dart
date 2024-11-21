class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
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
