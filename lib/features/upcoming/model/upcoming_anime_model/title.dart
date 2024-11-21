// title.dart
class Title {
  String? type;
  String? title;

  Title({
    this.type,
    this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json['type'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
      };
}
