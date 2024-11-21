class Title {
  final String? type;
  final String? title;

  Title({this.type, this.title});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      type: json['type'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}
