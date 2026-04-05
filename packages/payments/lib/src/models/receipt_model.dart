import 'package:equatable/equatable.dart';

class ReceiptModel extends Equatable {
  final String id;
  final String name;
  final double value;
  final String category;
  final bool verified;

  const ReceiptModel({
    required this.id,
    required this.name,
    required this.value,
    required this.category,
    required this.verified,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
      id: json['id'] as String,
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      category: json['category'] as String,
      verified: json['verified'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'category': category,
      'verified': verified,
    };
  }

  ReceiptModel copyWith({
    String? id,
    String? name,
    double? value,
    String? category,
    bool? verified,
  }) {
    return ReceiptModel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      category: category ?? this.category,
      verified: verified ?? this.verified,
    );
  }

  @override
  List<Object?> get props => [id, name, value, category, verified];
}
