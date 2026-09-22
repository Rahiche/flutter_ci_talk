import 'package:equatable/equatable.dart';

class OnboardingItem extends Equatable {
  const OnboardingItem({required this.id, required this.label, this.amount = 0});

  final String id;
  final String label;
  final int amount;

  OnboardingItem copyWith({String? id, String? label, int? amount}) => OnboardingItem(
        id: id ?? this.id,
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  Map<String, Object?> toJson() =>
      {'id': id, 'label': label, 'amount': amount};

  static OnboardingItem fromJson(Map<String, Object?> json) => OnboardingItem(
        id: json['id']! as String,
        label: json['label']! as String,
        amount: json['amount']! as int,
      );

  @override
  List<Object?> get props => [id, label, amount];
}

class OnboardingState extends Equatable {
  const OnboardingState({this.items = const [], this.loading = false});

  final List<OnboardingItem> items;
  final bool loading;

  int get total => items.fold(0, (a, b) => a + b.amount);

  @override
  List<Object?> get props => [items, loading];
}
