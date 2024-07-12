import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostLocation {
  const PostLocation(
    this.location,
    this.roadSigns,
  );

  final Map<String, dynamic> location;
  final List<Map<String, String>> roadSigns;

  PostLocation copyWith({
    Map<String, dynamic>? location,
    List<Map<String, String>>? roadSigns,
  }) {
    return PostLocation(
      location ?? this.location,
      roadSigns ?? this.roadSigns,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'roadSigns': roadSigns,
    };
  }

  factory PostLocation.fromMap(Map<String, dynamic> map) {
    return PostLocation(
      Map<String, dynamic>.from((map['location'] as Map<String, dynamic>)),
      List<Map<String, String>>.from(
        (map['roadSigns'] as List<Map<String, String>>)
            .map<Map<String, String>>((x) => x),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostLocation.fromJson(String source) =>
      PostLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostLocation(location: $location, roadSigns: $roadSigns)';

  @override
  bool operator ==(covariant PostLocation other) {
    if (identical(this, other)) return true;

    return mapEquals(other.location, location) &&
        listEquals(other.roadSigns, roadSigns);
  }

  @override
  int get hashCode => location.hashCode ^ roadSigns.hashCode;
}
