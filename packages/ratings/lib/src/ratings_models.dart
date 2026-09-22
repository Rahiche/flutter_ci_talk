import 'package:equatable/equatable.dart';

class RatingsItem extends Equatable {
  const RatingsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  RatingsItem copyWith({String? id, String? label, int? amount}) => RatingsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static RatingsItem fromJson(Map<String, Object?> json) => RatingsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class RatingsState extends Equatable {
  const RatingsState({this.items = const [], this.loading = false});

  final List<RatingsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
