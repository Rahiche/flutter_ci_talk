import 'package:equatable/equatable.dart';

class MapsItem extends Equatable {
  const MapsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  MapsItem copyWith({String? id, String? label, int? amount}) => MapsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static MapsItem fromJson(Map<String, Object?> json) => MapsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class MapsState extends Equatable {
  const MapsState({this.items = const [], this.loading = false});

  final List<MapsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
