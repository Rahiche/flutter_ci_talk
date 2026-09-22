import 'package:equatable/equatable.dart';

class CoreDataItem extends Equatable {
  const CoreDataItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CoreDataItem copyWith({String? id, String? label, int? amount}) => CoreDataItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CoreDataItem fromJson(Map<String, Object?> json) => CoreDataItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CoreDataState extends Equatable {
  const CoreDataState({this.items = const [], this.loading = false});

  final List<CoreDataItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
