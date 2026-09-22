import 'package:equatable/equatable.dart';

class NotificationsApiItem extends Equatable {
  const NotificationsApiItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  NotificationsApiItem copyWith({String? id, String? label, int? amount}) => NotificationsApiItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static NotificationsApiItem fromJson(Map<String, Object?> json) => NotificationsApiItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class NotificationsApiState extends Equatable {
  const NotificationsApiState({this.items = const [], this.loading = false});

  final List<NotificationsApiItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
