import 'person.dart';

class Datum {
  Person? person;
  List<String>? positions;

  Datum({this.person, this.positions});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        person: json['person'] == null
            ? null
            : Person.fromJson(json['person'] as Map<String, dynamic>),
        positions: json['positions'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'person': person?.toJson(),
        'positions': positions,
      };
}
