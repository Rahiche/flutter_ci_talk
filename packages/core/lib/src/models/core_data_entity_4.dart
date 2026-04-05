import 'package:equatable/equatable.dart';

class CoreDataEntity4 extends Equatable {
  final String id;
  final String label;
  final int sortOrder;
  final bool isEnabled;
  final double score;

  const CoreDataEntity4({
    required this.id,
    required this.label,
    required this.sortOrder,
    required this.isEnabled,
    required this.score,
  });

  factory CoreDataEntity4.fromJson(Map<String, dynamic> json) {
    return CoreDataEntity4(
      id: json['id'] as String,
      label: json['label'] as String,
      sortOrder: json['sortOrder'] as int,
      isEnabled: json['isEnabled'] as bool,
      score: (json['score'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'sortOrder': sortOrder,
    'isEnabled': isEnabled,
    'score': score,
  };

  CoreDataEntity4 copyWith({
    String? id,
    String? label,
    int? sortOrder,
    bool? isEnabled,
    double? score,
  }) => CoreDataEntity4(
    id: id ?? this.id,
    label: label ?? this.label,
    sortOrder: sortOrder ?? this.sortOrder,
    isEnabled: isEnabled ?? this.isEnabled,
    score: score ?? this.score,
  );

  @override
  List<Object?> get props => [id, label, sortOrder, isEnabled, score];
}
