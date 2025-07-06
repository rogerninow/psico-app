import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:psico_app/app/core/constants/configuration.dart';

class Dialogs {

  static showError(String message) async {
    EasyLoading.dismiss();

    await EasyLoading.showError(
        message,
        duration: Configuration.MESSAGES_DURATION
    );
  }

  static showInfo(String message) async {
    EasyLoading.dismiss();

    await EasyLoading.showInfo(
      message,
      duration: Configuration.MESSAGES_DURATION,
      maskType: EasyLoadingMaskType.black
    );
  }

  static showSuccess(String message) async {
    EasyLoading.dismiss();

    await EasyLoading.showSuccess(
        message,
        duration: Configuration.MESSAGES_DURATION
    );
  }
}