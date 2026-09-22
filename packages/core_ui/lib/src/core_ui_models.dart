import 'package:equatable/equatable.dart';

class CoreUiItem extends Equatable {
  const CoreUiItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CoreUiItem copyWith({String? id, String? label, int? amount}) => CoreUiItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CoreUiItem fromJson(Map<String, Object?> json) => CoreUiItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CoreUiState extends Equatable {
  const CoreUiState({this.items = const [], this.loading = false});

  final List<CoreUiItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
