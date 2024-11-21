import 'entry.dart';

class Relation {
  String? relation;
  List<Entry>? entry;

  Relation({this.relation, this.entry});

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        relation: json['relation'] as String?,
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'relation': relation,
        'entry': entry?.map((e) => e.toJson()).toList(),
      };
}
