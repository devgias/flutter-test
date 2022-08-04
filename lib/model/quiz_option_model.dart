part of 'models.dart';

class QuizOptionModel extends Equatable {
  const QuizOptionModel({
    this.id,
    this.quizQuestionId,
    this.content,
    this.isTrue,
  });

  final int? id;
  final int? quizQuestionId;
  final String? content;
  final bool? isTrue;

  factory QuizOptionModel.fromJson(Map<String, dynamic> json) =>
      QuizOptionModel(
        id: json["id"],
        quizQuestionId: json["quiz_question_id"],
        content: json["content"],
        isTrue: json["is_true"] == 0 ? false : true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_question_id": quizQuestionId,
        "content": content,
        "is_true": isTrue,
      };

  @override
  List<Object?> get props => [
        id,
        quizQuestionId,
        content,
        isTrue,
      ];
}
