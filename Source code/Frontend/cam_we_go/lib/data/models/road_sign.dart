import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoadSign {
  const RoadSign(
    this.id,
    this.name,
    this.description,
    this.imageLink,
    this.category,
  );
  final int id;
  final String name;
  final Map<String, dynamic> description;
  final String imageLink;
  final String category;

  RoadSign copyWith({
    int? id,
    String? name,
    Map<String, dynamic>? description,
    String? imageLink,
    String? category,
  }) {
    return RoadSign(
      id ?? this.id,
      name ?? this.name,
      description ?? this.description,
      imageLink ?? this.imageLink,
      category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageLink': imageLink,
      'category': category,
    };
  }

  factory RoadSign.fromMap(Map<String, dynamic> map) {
    return RoadSign(
      map['id'] as int,
      map['name'] as String,
      Map<String, dynamic>.from((map['description'] as Map<String, dynamic>)),
      map['imageLink'] as String,
      map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoadSign.fromJson(String source) => RoadSign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoadSign(id: $id, name: $name, description: $description, imageLink: $imageLink, category: $category)';
  }

  @override
  bool operator ==(covariant RoadSign other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      mapEquals(other.description, description) &&
      other.imageLink == imageLink &&
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      imageLink.hashCode ^
      category.hashCode;
  }
}
