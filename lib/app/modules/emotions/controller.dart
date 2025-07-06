import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/data/models/emotion.dart';
import 'package:psico_app/app/data/models/emotion_type.dart';
import 'package:psico_app/app/modules/emotions/widgets/add_emotion_dialog.dart';

class EmotionsController extends GetxController {
  RxList<Emotion> list = <Emotion>[].obs;

  RxString emotion = ''.obs;
  TextEditingController commentField  = TextEditingController();
  List<EmotionType> emotionTypes = EmotionType.getEmotions();

  @override
  void onReady() async {
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
  }

  Future<void> addEmotion() async {
    DateTime dateTime = DateTime.now();
    list.add(
      Emotion(
        emotion.value,
        EmotionType.getEmotionTypeByName(emotion.value),
        dateTime,
        commentField.text
      )
    );
  }

  Future<void> removeEmotion(DateTime dateTime) async {
    list.removeWhere((Emotion emotion) => emotion.dateTime == dateTime);
  }

  void openEmotionsDialog() {
    commentField.text = '';
    emotion.value = '';
    AddEmotionDialog.show();
  }
}