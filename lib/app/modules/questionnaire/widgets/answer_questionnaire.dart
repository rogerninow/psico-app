import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/data/models/answer.dart';
import 'package:psico_app/app/data/models/quesiton.dart';
import 'package:psico_app/app/data/models/question_type.dart';
import 'package:psico_app/app/modules/questionnaire/controller.dart';
import 'package:psico_app/app/widgets/dialogs/generic.dart';

class AnswerQuestionnaireDialog {

  static void show(int index) {
    QuestionnaireController _ = Get.find();

    GenericDialog(
      _.list[index].name,
      Padding(
        padding: EdgeInsetsGeometry.only(bottom: 25),
        child: Text(
          _.list[index].description,
          textAlign: TextAlign.start
        ),
      ),
      () => _.saveQuestionnaire(index),
      middleComponent: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (Question question in _.list[index].questions)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsetsGeometry.only(top: 20)),
                if (question.type.name == QuestionType.FREE_TEXT)
                  SizedBox(
                    width: MediaQuery.of(Get.context!).size.width * .70,
                    child: TextField(
                      maxLines: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: question.description,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        )
                      ),
                      onChanged: (value) => _.setUserResponse(index, question.index, value)
                    ),
                  ),
                if (question.type.name == QuestionType.MULTI_OPTION && question.options != null)
                  DropdownMenu<Answer>(
                    enableFilter: true,
                    requestFocusOnTap: true,
                    leadingIcon: const Icon(Icons.search),
                    label: Text('${question.description}'),
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    ),
                    onSelected: (Answer? answer) {
                      _.setUserResponse(index, question.index, answer?.index.toString());
                    },
                    dropdownMenuEntries: question.options!.map(
                      (Answer answer) => DropdownMenuEntry<Answer>(label: answer.name, value: answer)
                    ).toList(),
                  ),
                Padding(padding: EdgeInsetsGeometry.only(top: 15))
              ],
            )
        ],
      ),
      okButtonText: 'save'.tr,
      secondaryButtonAction: () async {
        Navigator.pop(Get.context!);
      },
      secondaryButtonText: 'cancel'.tr,
      size: MediaQuery.of(Get.context!).size.height * 0.80
    ).show();
  }
}