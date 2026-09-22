import 'package:equatable/equatable.dart';

class ReceiptsItem extends Equatable {
  const ReceiptsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  ReceiptsItem copyWith({String? id, String? label, int? amount}) => ReceiptsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static ReceiptsItem fromJson(Map<String, Object?> json) => ReceiptsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class ReceiptsState extends Equatable {
  const ReceiptsState({this.items = const [], this.loading = false});

  final List<ReceiptsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
