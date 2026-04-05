import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final String id;
  final String name;
  final int count;
  final bool enabled;
  final String description;

  const SettingsModel({
    required this.id,
    required this.name,
    required this.count,
    required this.enabled,
    required this.description,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      enabled: json['enabled'] as bool,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'count': count,
      'enabled': enabled,
      'description': description,
    };
  }

  SettingsModel copyWith({
    String? id,
    String? name,
    int? count,
    bool? enabled,
    String? description,
  }) {
    return SettingsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      enabled: enabled ?? this.enabled,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [id, name, count, enabled, description];
}
