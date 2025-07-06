import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psico_app/app/data/models/emotion_type.dart';
import 'package:psico_app/app/modules/emotions/controller.dart';

class EmotionsRating extends StatelessWidget {

  @override
  Widget build(context) {
    double iconSize = 40;
    EmotionsController _ = Get.find();

    return Column(
      children: [
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (EmotionType emotionType in _.emotionTypes)
              Column(
                children: [
                  IconButton(
                      onPressed: () => _.emotion.value = emotionType.name,
                      icon: FaIcon(
                        emotionType.icon,
                        size: iconSize,
                        color: _.emotion.value == emotionType.name ? emotionType.color : Colors.grey
                      )
                  ),
                  Text(
                    '${emotionType.name}'.tr,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: _.emotion.value == emotionType.name ? emotionType.color : Colors.grey
                    )
                  )
                ],
              ),
          ],
        )),
      ],
    );
  }
}

