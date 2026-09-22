import 'package:equatable/equatable.dart';

class BillingItem extends Equatable {
  const BillingItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  BillingItem copyWith({String? id, String? label, int? amount}) => BillingItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static BillingItem fromJson(Map<String, Object?> json) => BillingItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class BillingState extends Equatable {
  const BillingState({this.items = const [], this.loading = false});

  final List<BillingItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
