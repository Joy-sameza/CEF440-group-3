import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoadState {
  const RoadState(
    this.roadState,
    this.status,
    this.location,
    this.ttl,
  );
  final String roadState;
  final String status;
  final Map<String, dynamic> location;
  final num ttl;

  RoadState copyWith({
    String? roadState,
    String? status,
    Map<String, dynamic>? location,
    num? ttl,
  }) {
    return RoadState(
      roadState ?? this.roadState,
      status ?? this.status,
      location ?? this.location,
      ttl ?? this.ttl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roadState': roadState,
      'status': status,
      'location': location,
      'ttl': ttl,
    };
  }

  factory RoadState.fromMap(Map<String, dynamic> map) {
    return RoadState(
      map['roadState'] as String,
      map['status'] as String,
      Map<String, dynamic>.from((map['location'] as Map<String, dynamic>)),
      map['ttl'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoadState.fromJson(String source) =>
      RoadState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoadState(roadState: $roadState, status: $status, location: $location, ttl: $ttl)';
  }

  @override
  bool operator ==(covariant RoadState other) {
    if (identical(this, other)) return true;

    return other.roadState == roadState &&
        other.status == status &&
        mapEquals(other.location, location) &&
        other.ttl == ttl;
  }

  @override
  int get hashCode {
    return roadState.hashCode ^
        status.hashCode ^
        location.hashCode ^
        ttl.hashCode;
  }
}

  // final Map location = {
  //   'type': 'Point',
  //   'coordinates': [0, 0],
  // };
