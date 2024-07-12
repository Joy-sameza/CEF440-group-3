import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  const User(
    this.name,
    this.email,
    this.password,
    this.roadSignPreferences,
    this.roadStatePreferences,
  );
  final String name;
  final String email;
  final String password;
  final List<String> roadSignPreferences;
  final List<String> roadStatePreferences;

  User copyWith({
    String? name,
    String? email,
    String? password,
    List<String>? roadSignPreferences,
    List<String>? roadStatePreferences,
  }) {
    return User(
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      roadSignPreferences ?? this.roadSignPreferences,
      roadStatePreferences ?? this.roadStatePreferences,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'roadSignPreferences': roadSignPreferences,
      'roadStatePreferences': roadStatePreferences,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      List<String>.from((map['roadSignPreferences'] as List<String>)),
      List<String>.from((map['roadStatePreferences'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, roadSignPreferences: $roadSignPreferences, roadStatePreferences: $roadStatePreferences)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        listEquals(other.roadSignPreferences, roadSignPreferences) &&
        listEquals(other.roadStatePreferences, roadStatePreferences);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        roadSignPreferences.hashCode ^
        roadStatePreferences.hashCode;
  }
}
