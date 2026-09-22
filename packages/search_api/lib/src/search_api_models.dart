import 'package:equatable/equatable.dart';

class SearchApiItem extends Equatable {
  const SearchApiItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  SearchApiItem copyWith({String? id, String? label, int? amount}) => SearchApiItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static SearchApiItem fromJson(Map<String, Object?> json) => SearchApiItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class SearchApiState extends Equatable {
  const SearchApiState({this.items = const [], this.loading = false});

  final List<SearchApiItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
