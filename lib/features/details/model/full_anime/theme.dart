class Theme {
  List<String>? openings;
  List<String>? endings;

  Theme({this.openings, this.endings});

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        openings: json['openings'] as List<String>?,
        endings: json['endings'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'openings': openings,
        'endings': endings,
      };
}
