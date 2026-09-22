import 'package:equatable/equatable.dart';

class CheckoutItem extends Equatable {
  const CheckoutItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CheckoutItem copyWith({String? id, String? label, int? amount}) => CheckoutItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CheckoutItem fromJson(Map<String, Object?> json) => CheckoutItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CheckoutState extends Equatable {
  const CheckoutState({this.items = const [], this.loading = false});

  final List<CheckoutItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
