class Images {
  String? imageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json['image_url'] as String?,
        smallImageUrl: json['small_image_url'] as String?,
        mediumImageUrl: json['medium_image_url'] as String?,
        largeImageUrl: json['large_image_url'] as String?,
        maximumImageUrl: json['maximum_image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
        'small_image_url': smallImageUrl,
        'medium_image_url': mediumImageUrl,
        'large_image_url': largeImageUrl,
        'maximum_image_url': maximumImageUrl,
      };
}
