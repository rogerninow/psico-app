import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psico_app/app/data/models/questionnaire.dart';
import 'package:psico_app/app/modules/questionnaire/controller.dart';
import 'package:psico_app/app/modules/questionnaire/widgets/answer_questionnaire.dart';
import 'package:psico_app/app/widgets/utils/app_bar.dart';

class QuestionnairePage extends GetView<QuestionnaireController> {

  @override
  Widget build(context) {
    QuestionnaireController _ = Get.put(QuestionnaireController());

     return Scaffold(
       appBar: DefaultAppBar('questionnaire_page'.tr, Icons.refresh, () => null),
       body: Obx(() => SingleChildScrollView(child: Column(
         children: [
           Padding(
             padding: EdgeInsetsGeometry.all(20),
             child: Text('questionnaire_page_info'.tr, style: GoogleFonts.lato(fontSize: 16)),
           ),
            for (Questionnaire questionnaire in _.list)
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(50, 10, 50, 10),
                child: ListTile(
                  leading: Icon(
                    questionnaire.isCompleted() ? FontAwesomeIcons.fileCircleCheck : FontAwesomeIcons.fileCircleQuestion,
                    size: 32,
                    color: questionnaire.isCompleted() ? Colors.teal : Colors.grey
                  ),
                  trailing: Text("${questionnaire.getCompletedDate()}"),
                  title: Text(questionnaire.name),
                  subtitle: Text(questionnaire.description),
                  contentPadding: EdgeInsetsGeometry.only(left: 0),
                  onTap: () =>  questionnaire.isCompleted() ? null : AnswerQuestionnaireDialog.show(questionnaire.index-1)
                )
             )
         ],
       )))
     );
  }
}
