import 'package:equatable/equatable.dart';

class NotificationsItem extends Equatable {
  const NotificationsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  NotificationsItem copyWith({String? id, String? label, int? amount}) => NotificationsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static NotificationsItem fromJson(Map<String, Object?> json) => NotificationsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class NotificationsState extends Equatable {
  const NotificationsState({this.items = const [], this.loading = false});

  final List<NotificationsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
