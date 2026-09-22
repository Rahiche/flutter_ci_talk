import 'package:equatable/equatable.dart';

class AnalyticsEventsItem extends Equatable {
  const AnalyticsEventsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  AnalyticsEventsItem copyWith({String? id, String? label, int? amount}) => AnalyticsEventsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static AnalyticsEventsItem fromJson(Map<String, Object?> json) => AnalyticsEventsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class AnalyticsEventsState extends Equatable {
  const AnalyticsEventsState({this.items = const [], this.loading = false});

  final List<AnalyticsEventsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
