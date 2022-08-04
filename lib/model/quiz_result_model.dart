part of 'models.dart';

class QuizResultModel extends Equatable {
  final int? id;
  final int? value;
  final int? correctAnswer;
  final int? totalQuestion;
  final QuizModel? quizModel;
  final DateTime? start;
  final DateTime? end;

  const QuizResultModel({
    this.id,
    this.value,
    this.correctAnswer,
    this.totalQuestion,
    this.quizModel,
    this.start,
    this.end,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      QuizResultModel(
        id: json["id"],
        value: json["value"],
        correctAnswer: json["correct_answer"],
        totalQuestion: json["total_question"],
        quizModel: QuizModel.fromJson(json["quiz"] ?? {}),
        start: DateTime.fromMillisecondsSinceEpoch(json["created_at"]),
        end: DateTime.fromMillisecondsSinceEpoch(json["updated_at"]),
      );
  @override
  List<Object?> get props => [
        id,
        value,
        correctAnswer,
        totalQuestion,
        quizModel,
        start,
        end,
      ];
}
