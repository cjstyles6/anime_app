class User {
  String? url;
  String? username;

  User({this.url, this.username});

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json['url'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'username': username,
      };
}
