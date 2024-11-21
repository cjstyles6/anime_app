import 'person.dart';

class VoiceActor {
  Person? person;
  String? language;

  VoiceActor({this.person, this.language});

  factory VoiceActor.fromJson(Map<String, dynamic> json) => VoiceActor(
        person: json['person'] == null
            ? null
            : Person.fromJson(json['person'] as Map<String, dynamic>),
        language: json['language'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'person': person?.toJson(),
        'language': language,
      };
}
