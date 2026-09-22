import 'package:equatable/equatable.dart';

class SessionItem extends Equatable {
  const SessionItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  SessionItem copyWith({String? id, String? label, int? amount}) => SessionItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static SessionItem fromJson(Map<String, Object?> json) => SessionItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class SessionState extends Equatable {
  const SessionState({this.items = const [], this.loading = false});

  final List<SessionItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
