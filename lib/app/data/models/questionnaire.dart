import 'package:psico_app/app/data/models/quesiton.dart';

class Questionnaire {
  int index;
  String name;
  String description;
  List<Question> questions;
  bool? completed = false;
  DateTime? completedAt;

  Questionnaire(this.index, this.name, this.description, this.questions, {this.completed, this.completedAt});

  bool isCompleted() {
    return completed == true;
  }

  String getCompletedDate() {
    return completedAt != null ?
      "${completedAt?.day}/${completedAt?.month} ${completedAt?.hour}:${completedAt?.minute}"
    : '';
  }
}