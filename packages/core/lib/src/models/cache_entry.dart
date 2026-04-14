import 'package:equatable/equatable.dart';

class CacheEntry extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final String type;
  final int priority;

  const CacheEntry({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.type,
    required this.priority,
  });

  factory CacheEntry.fromJson(Map<String, dynamic> json) {
    return CacheEntry(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: json['type'] as String,
      priority: json['priority'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'type': type,
      'priority': priority,
    };
  }

  CacheEntry copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    String? type,
    int? priority,
  }) {
    return CacheEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      priority: priority ?? this.priority,
    );
  }

  @override
  List<Object?> get props => [id, name, createdAt, type, priority];
}
