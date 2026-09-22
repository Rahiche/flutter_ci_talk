import 'package:equatable/equatable.dart';

class TelemetryItem extends Equatable {
  const TelemetryItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  TelemetryItem copyWith({String? id, String? label, int? amount}) => TelemetryItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static TelemetryItem fromJson(Map<String, Object?> json) => TelemetryItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class TelemetryState extends Equatable {
  const TelemetryState({this.items = const [], this.loading = false});

  final List<TelemetryItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
