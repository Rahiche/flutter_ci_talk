import 'package:equatable/equatable.dart';

class AuthItem extends Equatable {
  const AuthItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  AuthItem copyWith({String? id, String? label, int? amount}) => AuthItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static AuthItem fromJson(Map<String, Object?> json) => AuthItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class AuthState extends Equatable {
  const AuthState({this.items = const [], this.loading = false});

  final List<AuthItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
