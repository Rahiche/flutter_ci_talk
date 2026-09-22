import 'package:equatable/equatable.dart';

class LoyaltyItem extends Equatable {
  const LoyaltyItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  LoyaltyItem copyWith({String? id, String? label, int? amount}) => LoyaltyItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static LoyaltyItem fromJson(Map<String, Object?> json) => LoyaltyItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class LoyaltyState extends Equatable {
  const LoyaltyState({this.items = const [], this.loading = false});

  final List<LoyaltyItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
