import 'package:psico_app/app/data/models/answer.dart';
import 'package:psico_app/app/data/models/question_type.dart';

class Question {
  int index;
  String description;
  QuestionType type;
  List<Answer>? options;
  String? userResponse;

  Question(this.index, this.description, this.type, {this.options, this.userResponse});
}