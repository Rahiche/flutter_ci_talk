import 'package:equatable/equatable.dart';

class CoreUtilsItem extends Equatable {
  const CoreUtilsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CoreUtilsItem copyWith({String? id, String? label, int? amount}) => CoreUtilsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CoreUtilsItem fromJson(Map<String, Object?> json) => CoreUtilsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CoreUtilsState extends Equatable {
  const CoreUtilsState({this.items = const [], this.loading = false});

  final List<CoreUtilsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
