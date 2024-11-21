// staff_models.dart
// import 'datum.dart';

class StaffModels {
  List<StaffDatum>? data;

  StaffModels({this.data});

  factory StaffModels.fromJson(Map<String, dynamic> json) => StaffModels(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => StaffDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

// staff_datum.dart
class StaffDatum {
  final Person? person;
  final List<String>? positions;

  StaffDatum({
    this.person,
    this.positions,
  });

  factory StaffDatum.fromJson(Map<String, dynamic> json) => StaffDatum(
        person: json['person'] == null
            ? null
            : Person.fromJson(json['person'] as Map<String, dynamic>),
        positions: (json['positions'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'person': person?.toJson(),
        'positions': positions,
      };
}

// person.dart
class Person {
  final Images? images;
  final String? name;

  Person({
    this.images,
    this.name,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'images': images?.toJson(),
        'name': name,
      };
}

// images.dart
class Images {
  final Jpg? jpg;

  Images({this.jpg});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: json['jpg'] == null
            ? null
            : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'jpg': jpg?.toJson(),
      };
}

// jpg.dart
class Jpg {
  final String? imageUrl;

  Jpg({this.imageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
      };
}
