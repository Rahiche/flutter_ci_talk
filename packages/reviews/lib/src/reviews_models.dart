import 'package:equatable/equatable.dart';

class ReviewsItem extends Equatable {
  const ReviewsItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  ReviewsItem copyWith({String? id, String? label, int? amount}) => ReviewsItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static ReviewsItem fromJson(Map<String, Object?> json) => ReviewsItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class ReviewsState extends Equatable {
  const ReviewsState({this.items = const [], this.loading = false});

  final List<ReviewsItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
