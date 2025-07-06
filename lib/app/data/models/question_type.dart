import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionType {
  static const FREE_TEXT    = 'free-text';
  static const MULTI_OPTION = 'multi-option';
  
  int    index;
  String name;
  IconData icon;

  QuestionType(this.index, this.name, this.icon);

  static List<QuestionType> getQuestionTypes() {
    return [
      QuestionType(1, FREE_TEXT,    FontAwesomeIcons.font),
      QuestionType(2, MULTI_OPTION, FontAwesomeIcons.list)
    ];
  }

  static QuestionType getQuestionTypeByName(String name) {
    switch (name) {
      case 'free-text':    return QuestionType(1, FREE_TEXT,    FontAwesomeIcons.font);
      case 'multi-option': return QuestionType(2, MULTI_OPTION, FontAwesomeIcons.list);
    }

    return QuestionType(1, FREE_TEXT, FontAwesomeIcons.faceFrown);
  }
}