import 'package:equatable/equatable.dart';

class SettingsItem extends Equatable {
  const SettingsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  SettingsItem copyWith({String? id, String? label, int? amount}) => SettingsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static SettingsItem fromJson(Map<String, Object?> json) => SettingsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class SettingsState extends Equatable {
  const SettingsState({this.items = const [], this.loading = false});

  final List<SettingsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
