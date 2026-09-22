import 'package:equatable/equatable.dart';

class OrdersItem extends Equatable {
  const OrdersItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  OrdersItem copyWith({String? id, String? label, int? amount}) => OrdersItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static OrdersItem fromJson(Map<String, Object?> json) => OrdersItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class OrdersState extends Equatable {
  const OrdersState({this.items = const [], this.loading = false});

  final List<OrdersItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
