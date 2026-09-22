import 'package:equatable/equatable.dart';

class CoreNetworkItem extends Equatable {
  const CoreNetworkItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CoreNetworkItem copyWith({String? id, String? label, int? amount}) => CoreNetworkItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CoreNetworkItem fromJson(Map<String, Object?> json) => CoreNetworkItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CoreNetworkState extends Equatable {
  const CoreNetworkState({this.items = const [], this.loading = false});

  final List<CoreNetworkItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
