import 'package:equatable/equatable.dart';

class CatalogItem extends Equatable {
  const CatalogItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CatalogItem copyWith({String? id, String? label, int? amount}) => CatalogItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CatalogItem fromJson(Map<String, Object?> json) => CatalogItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CatalogState extends Equatable {
  const CatalogState({this.items = const [], this.loading = false});

  final List<CatalogItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
