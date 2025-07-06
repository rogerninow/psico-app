import 'package:psico_app/app/data/models/emotion_type.dart';

class Emotion {
  String      name;
  DateTime    dateTime;
  String      comment;
  EmotionType emotionType;

  Emotion(this.name, this.emotionType, this.dateTime, this.comment);
}