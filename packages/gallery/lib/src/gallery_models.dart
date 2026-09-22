import 'package:equatable/equatable.dart';

class GalleryItem extends Equatable {
  const GalleryItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  GalleryItem copyWith({String? id, String? label, int? amount}) => GalleryItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static GalleryItem fromJson(Map<String, Object?> json) => GalleryItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class GalleryState extends Equatable {
  const GalleryState({this.items = const [], this.loading = false});

  final List<GalleryItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
