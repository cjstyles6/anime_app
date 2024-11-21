import 'prop.dart';

class Aired {
  dynamic from;
  dynamic to;
  Prop? prop;
  String? string;

  Aired({this.from, this.to, this.prop, this.string});

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json['from'] as dynamic,
        to: json['to'] as dynamic,
        prop: json['prop'] == null
            ? null
            : Prop.fromJson(json['prop'] as Map<String, dynamic>),
        string: json['string'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'prop': prop?.toJson(),
        'string': string,
      };
}
