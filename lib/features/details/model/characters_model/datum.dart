import 'character.dart';
import 'voice_actor.dart';

class Datum {
  Character? character;
  String? role;
  int? favorites;
  List<VoiceActor>? voiceActors;

  Datum({this.character, this.role, this.favorites, this.voiceActors});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        character: json['character'] == null
            ? null
            : Character.fromJson(json['character'] as Map<String, dynamic>),
        role: json['role'] as String?,
        favorites: json['favorites'] as int?,
        voiceActors: (json['voice_actors'] as List<dynamic>?)
            ?.map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'character': character?.toJson(),
        'role': role,
        'favorites': favorites,
        'voice_actors': voiceActors?.map((e) => e.toJson()).toList(),
      };
}
