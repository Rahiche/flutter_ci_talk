import 'package:equatable/equatable.dart';

class CalendarItem extends Equatable {
  const CalendarItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  CalendarItem copyWith({String? id, String? label, int? amount}) => CalendarItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static CalendarItem fromJson(Map<String, Object?> json) => CalendarItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class CalendarState extends Equatable {
  const CalendarState({this.items = const [], this.loading = false});

  final List<CalendarItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
