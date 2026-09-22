import 'package:equatable/equatable.dart';

class FeedItem extends Equatable {
  const FeedItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  FeedItem copyWith({String? id, String? label, int? amount}) => FeedItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static FeedItem fromJson(Map<String, Object?> json) => FeedItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class FeedState extends Equatable {
  const FeedState({this.items = const [], this.loading = false});

  final List<FeedItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
