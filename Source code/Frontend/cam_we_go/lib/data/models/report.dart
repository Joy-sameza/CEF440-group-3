import 'dart:convert';

class Report {
  const Report(
    this.nature,
    this.description,
    this.filePath,
    this.userId,
  );
  final String nature;
  final String description;
  final String? filePath;
  final int userId;

  Report copyWith({
    String? nature,
    String? description,
    String? filePath,
    int? userId,
  }) {
    return Report(
      nature ?? this.nature,
      description ?? this.description,
      filePath ?? this.filePath,
      userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nature': nature,
      'description': description,
      'filePath': filePath,
      'userId': userId,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      map['nature'] as String,
      map['description'] as String,
      map['filePath'] != null ? map['filePath'] as String : null,
      map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Report(nature: $nature, description: $description, filePath: $filePath, userId: $userId)';
  }

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;
  
    return 
      other.nature == nature &&
      other.description == description &&
      other.filePath == filePath &&
      other.userId == userId;
  }

  @override
  int get hashCode {
    return nature.hashCode ^
      description.hashCode ^
      filePath.hashCode ^
      userId.hashCode;
  }
}
