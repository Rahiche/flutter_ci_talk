import 'package:equatable/equatable.dart';

class ReferralsItem extends Equatable {
  const ReferralsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  ReferralsItem copyWith({String? id, String? label, int? amount}) => ReferralsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static ReferralsItem fromJson(Map<String, Object?> json) => ReferralsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class ReferralsState extends Equatable {
  const ReferralsState({this.items = const [], this.loading = false});

  final List<ReferralsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
