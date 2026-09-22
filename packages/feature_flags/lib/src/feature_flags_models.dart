import 'package:equatable/equatable.dart';

class FeatureFlagsItem extends Equatable {
  const FeatureFlagsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  FeatureFlagsItem copyWith({String? id, String? label, int? amount}) => FeatureFlagsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static FeatureFlagsItem fromJson(Map<String, Object?> json) => FeatureFlagsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class FeatureFlagsState extends Equatable {
  const FeatureFlagsState({this.items = const [], this.loading = false});

  final List<FeatureFlagsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
