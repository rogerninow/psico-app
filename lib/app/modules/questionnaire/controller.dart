import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/data/models/answer.dart';
import 'package:psico_app/app/data/models/quesiton.dart';
import 'package:psico_app/app/data/models/question_type.dart';
import 'package:psico_app/app/data/models/questionnaire.dart';

class QuestionnaireController extends GetxController {
  RxList<Questionnaire> list = <Questionnaire>[
    Questionnaire(
      1,
      'Questionário',
      'Este é um questionario',
      [
        Question(
          1,
          'Qual situação te deixa mais estressado?',
          QuestionType.getQuestionTypeByName('free-text')
        ),
        Question(
          2,
          'Qual situação te deixa mais estressado?',
          QuestionType.getQuestionTypeByName('multi-option'),
          options: [
            Answer(1, 'Discussões'),
            Answer(2, 'Transito'),
            Answer(3, 'Cachorros latindo'),
            Answer(4, 'Situações inesperadas')
          ],
        )
      ],
    ),
    Questionnaire(
      2,
      'Questionário 2',
      'Este é um outro questionario',
      [
        Question(
          1,
          'Qual situação te deixa menos estressado?',
          QuestionType.getQuestionTypeByName('free-text')
        ),
        Question(
          2,
          'Qual situação te deixa menos estressado?',
          QuestionType.getQuestionTypeByName('multi-option'),
          options: [
            Answer(1, 'Discussões'),
            Answer(2, 'Transito'),
            Answer(3, 'Cachorros latindo'),
            Answer(4, 'Situações inesperadas')
          ]
        ),
        Question(
            3,
            'Outra situação que te deixa menos estressado?',
            QuestionType.getQuestionTypeByName('multi-option'),
            options: [
              Answer(1, 'Discussões'),
              Answer(2, 'Transito'),
              Answer(3, 'Cachorros latindo'),
              Answer(4, 'Situações inesperadas')
            ]
        )
      ],
    )
  ].obs;

  @override
  void onReady() async {
    super.onReady();

  }

  void onClose() {
    super.onClose();
  }

  void saveQuestionnaire(int index) {
    list[index].completed   = true;
    list[index].completedAt = DateTime.now();
    list.refresh();
    Navigator.pop(Get.context!);
  }

  void setUserResponse(questionnaireIndex, questionIndex, value) {
    list[questionnaireIndex].questions[questionIndex-1].userResponse = value;
    list.refresh();
  }

  Future<void> refreshData() async {
  }
}