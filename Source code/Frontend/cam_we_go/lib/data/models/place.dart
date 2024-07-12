// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Place {
  const Place(
    this.shortName,
    this.formatedName,
    this.placeId,
    this.latitude,
    this.longitude,
  );
  final String shortName;
  final String formatedName;
  final String placeId;
  final double latitude;
  final double longitude;

  Place copyWith({
    String? shortName,
    String? formatedName,
    String? placeId,
    double? latitude,
    double? longitude,
  }) {
    return Place(
      shortName ?? this.shortName,
      formatedName ?? this.formatedName,
      placeId ?? this.placeId,
      latitude ?? this.latitude,
      longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shortName': shortName,
      'formatedName': formatedName,
      'placeId': placeId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      map['shortName'] as String,
      map['formatedName'] as String,
      map['placeId'] as String,
      map['latitude'] as double,
      map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Place(shortName: $shortName, formatedName: $formatedName, placeId: $placeId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.shortName == shortName &&
        other.formatedName == formatedName &&
        other.placeId == placeId &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return shortName.hashCode ^
        formatedName.hashCode ^
        placeId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
