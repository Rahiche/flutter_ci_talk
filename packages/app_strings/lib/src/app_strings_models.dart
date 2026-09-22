import 'package:equatable/equatable.dart';

class AppStringsItem extends Equatable {
  const AppStringsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  AppStringsItem copyWith({String? id, String? label, int? amount}) => AppStringsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static AppStringsItem fromJson(Map<String, Object?> json) => AppStringsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class AppStringsState extends Equatable {
  const AppStringsState({this.items = const [], this.loading = false});

  final List<AppStringsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
