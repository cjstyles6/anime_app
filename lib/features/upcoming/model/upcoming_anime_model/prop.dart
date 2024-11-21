import 'from.dart';
import 'to.dart';

class Prop {
  From? from;
  To? to;

  Prop({this.from, this.to});

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json['from'] == null
            ? null
            : From.fromJson(json['from'] as Map<String, dynamic>),
        to: json['to'] == null
            ? null
            : To.fromJson(json['to'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'from': from?.toJson(),
        'to': to?.toJson(),
      };
}
