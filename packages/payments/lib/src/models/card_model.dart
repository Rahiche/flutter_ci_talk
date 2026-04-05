import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final int age;
  final bool isActive;

  const CardModel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.isActive,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'isActive': isActive,
    };
  }

  CardModel copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
    bool? isActive,
  }) {
    return CardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, name, email, age, isActive];
}
