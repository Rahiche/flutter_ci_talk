import 'package:equatable/equatable.dart';

class SubscriptionsItem extends Equatable {
  const SubscriptionsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  SubscriptionsItem copyWith({String? id, String? label, int? amount}) => SubscriptionsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static SubscriptionsItem fromJson(Map<String, Object?> json) => SubscriptionsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class SubscriptionsState extends Equatable {
  const SubscriptionsState({this.items = const [], this.loading = false});

  final List<SubscriptionsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
