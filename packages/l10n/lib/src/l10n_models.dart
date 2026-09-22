import 'package:equatable/equatable.dart';

class L10nItem extends Equatable {
  const L10nItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  L10nItem copyWith({String? id, String? label, int? amount}) => L10nItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static L10nItem fromJson(Map<String, Object?> json) => L10nItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class L10nState extends Equatable {
  const L10nState({this.items = const [], this.loading = false});

  final List<L10nItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
