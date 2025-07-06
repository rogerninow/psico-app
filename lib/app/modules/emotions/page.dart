import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psico_app/app/data/models/emotion.dart';
import 'package:psico_app/app/modules/emotions/controller.dart';
import 'package:psico_app/app/modules/emotions/widgets/emotion_chart.dart';
import 'package:psico_app/app/modules/emotions/widgets/emotion_tile.dart';
import 'package:psico_app/app/widgets/utils/app_bar.dart';

class EmotionsPage extends GetView<EmotionsController> {
  @override
  Widget build(context) {
    EmotionsController _ = Get.put(EmotionsController());

    return Scaffold(
      appBar: DefaultAppBar('emotions_page'.tr, Icons.add, _.openEmotionsDialog),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Obx(() => Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Text('emotions_page_info'.tr, style: GoogleFonts.lato(fontSize: 16)),
                ),
                for (Emotion emotion in _.list.reversed.take(4))
                  EmotionTile(
                    emotion.name,
                    emotion.emotionType.icon,
                    emotion.emotionType.color,
                    emotion.comment,
                    () => _.removeEmotion(emotion.dateTime)
                  ),
                EmotionsChart()
              ],
            ))
          ),
        ],
      )
    );
  }
}
