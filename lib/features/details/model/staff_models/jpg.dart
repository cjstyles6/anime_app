class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
      };
}
