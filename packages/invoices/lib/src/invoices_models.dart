import 'package:equatable/equatable.dart';

class InvoicesItem extends Equatable {
  const InvoicesItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  InvoicesItem copyWith({String? id, String? label, int? amount}) => InvoicesItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static InvoicesItem fromJson(Map<String, Object?> json) => InvoicesItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class InvoicesState extends Equatable {
  const InvoicesState({this.items = const [], this.loading = false});

  final List<InvoicesItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
