import 'package:equatable/equatable.dart';

class CoreDataEntity1 extends Equatable {
  final String id;
  final String label;
  final int sortOrder;
  final bool isEnabled;
  final double score;

  const CoreDataEntity1({
    required this.id,
    required this.label,
    required this.sortOrder,
    required this.isEnabled,
    required this.score,
  });

  factory CoreDataEntity1.fromJson(Map<String, dynamic> json) {
    return CoreDataEntity1(
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

  CoreDataEntity1 copyWith({
    String? id,
    String? label,
    int? sortOrder,
    bool? isEnabled,
    double? score,
  }) => CoreDataEntity1(
    id: id ?? this.id,
    label: label ?? this.label,
    sortOrder: sortOrder ?? this.sortOrder,
    isEnabled: isEnabled ?? this.isEnabled,
    score: score ?? this.score,
  );

  @override
  List<Object?> get props => [id, label, sortOrder, isEnabled, score];
}
