import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psico_app/app/modules/emotions/controller.dart';
import 'package:psico_app/app/modules/emotions/widgets/emotions_list.dart';

import 'package:psico_app/app/widgets/dialogs/generic.dart';

class AddEmotionDialog {

  static void show() {
    EmotionsController _ = Get.find();

    GenericDialog(
     'add_emotion_title'.tr,
      Padding(
        padding: EdgeInsetsGeometry.only(bottom: 25),
        child: Text(
          'how_im_feeling_today'.tr,
          textAlign: TextAlign.start
        ),
      ),
      () async {
        Navigator.pop(Get.context!);
        _.addEmotion();
      },
      middleComponent: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          EmotionsRating(),
          Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: 50,
            child:  TextField(
              controller: _.commentField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'comment'.tr,
              ),
            ),
          ),
        ],
      ),
      okButtonText: 'save'.tr,
      secondaryButtonAction: () async {
        Navigator.pop(Get.context!);
      },
      secondaryButtonText: 'cancel'.tr,
      size: MediaQuery.of(Get.context!).size.height * 0.30
    ).show();
  }
}