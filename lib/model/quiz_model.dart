part of 'models.dart';

class QuizModel extends Equatable {
  final int? id;
  final ModulModel? modulModel;

  const QuizModel({
    this.id,
    this.modulModel,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'] as int,
        modulModel: ModulModel.fromJson(json['document']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'document': modulModel?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        modulModel,
      ];
}
