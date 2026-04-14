import 'package:equatable/equatable.dart';

class CohortModel extends Equatable {
  final String id;
  final String name;
  final double amount;
  final String currency;
  final String status;

  const CohortModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.currency,
    required this.status,
  });

  factory CohortModel.fromJson(Map<String, dynamic> json) {
    return CohortModel(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'currency': currency,
      'status': status,
    };
  }

  CohortModel copyWith({
    String? id,
    String? name,
    double? amount,
    String? currency,
    String? status,
  }) {
    return CohortModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, name, amount, currency, status];
}
