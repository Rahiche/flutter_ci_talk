import 'package:equatable/equatable.dart';

class SupportItem extends Equatable {
  const SupportItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  SupportItem copyWith({String? id, String? label, int? amount}) => SupportItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static SupportItem fromJson(Map<String, Object?> json) => SupportItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class SupportState extends Equatable {
  const SupportState({this.items = const [], this.loading = false});

  final List<SupportItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
