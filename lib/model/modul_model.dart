part of 'models.dart';

class ModulModel extends Equatable {
  final int? id;
  final String? name;
  final String? path;
  final bool? isQuizable;
  final int? quizId;

  const ModulModel({
    this.id,
    this.name,
    this.path,
    this.isQuizable,
    this.quizId,
  });

  ModulModel copyWith({
    int? id,
    String? name,
    String? path,
    bool? isQuizable,
    int? quizId,
  }) {
    return ModulModel(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      isQuizable: isQuizable ?? this.isQuizable,
      quizId: quizId ?? this.quizId,
    );
  }

  factory ModulModel.fromJson(Map<String, dynamic> json) => ModulModel(
        id: json['id'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        isQuizable: json['is_quizable'] ?? false,
        quizId: json['quiz_id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'path': path,
        'is_quizable': isQuizable,
        'quiz_id': quizId,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        path,
        isQuizable,
        quizId,
      ];
}
