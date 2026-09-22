import 'package:equatable/equatable.dart';

class MediaItem extends Equatable {
  const MediaItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  MediaItem copyWith({String? id, String? label, int? amount}) => MediaItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static MediaItem fromJson(Map<String, Object?> json) => MediaItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class MediaState extends Equatable {
  const MediaState({this.items = const [], this.loading = false});

  final List<MediaItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
