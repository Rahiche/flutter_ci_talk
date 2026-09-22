import 'package:equatable/equatable.dart';

class ProfileItem extends Equatable {
  const ProfileItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  ProfileItem copyWith({String? id, String? label, int? amount}) => ProfileItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static ProfileItem fromJson(Map<String, Object?> json) => ProfileItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class ProfileState extends Equatable {
  const ProfileState({this.items = const [], this.loading = false});

  final List<ProfileItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
