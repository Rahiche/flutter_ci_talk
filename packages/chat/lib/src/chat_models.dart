import 'package:equatable/equatable.dart';

class ChatItem extends Equatable {
  const ChatItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  ChatItem copyWith({String? id, String? label, int? amount}) => ChatItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static ChatItem fromJson(Map<String, Object?> json) => ChatItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class ChatState extends Equatable {
  const ChatState({this.items = const [], this.loading = false});

  final List<ChatItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
