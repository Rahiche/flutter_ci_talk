import 'package:equatable/equatable.dart';

class AddressesItem extends Equatable {
  const AddressesItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  AddressesItem copyWith({String? id, String? label, int? amount}) => AddressesItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static AddressesItem fromJson(Map<String, Object?> json) => AddressesItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class AddressesState extends Equatable {
  const AddressesState({this.items = const [], this.loading = false});

  final List<AddressesItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
