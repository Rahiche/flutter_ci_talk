import 'package:equatable/equatable.dart';

class DimensionModel extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final String type;
  final int priority;

  const DimensionModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.type,
    required this.priority,
  });

  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
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

  DimensionModel copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    String? type,
    int? priority,
  }) {
    return DimensionModel(
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
