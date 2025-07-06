import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoaderHelper {

  static show() async {
    // EasyLoading.dismiss();
    EasyLoading.show(status: '${'loading'.tr}...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
  }

  static dismiss() async {
    EasyLoading.dismiss();
  }
}