import 'images.dart';

class User {
  String? url;
  String? username;
  Images? images;

  User({this.url, this.username, this.images});

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json['url'] as String?,
        username: json['username'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'username': username,
        'images': images?.toJson(),
      };
}
