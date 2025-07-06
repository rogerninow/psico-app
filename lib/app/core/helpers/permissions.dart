import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psico_app/app/core/helpers/dialog.dart';

class Permissions {

  static getPermissions() async {
    PermissionStatus notificationStatus = await Permission.notification.status;

    if (notificationStatus.isGranted && !notificationStatus.isPermanentlyDenied) {
      await Permission.notification.request().then((value) => {
        if (!value.isGranted) {
          Dialogs.showInfo('permissions_notification_refused'.tr)
        }
      });
    }

    await requestLocationPermission();
  }

  static requestLocationPermission() async {
    // String deviceMessage = Platform.isAndroid ? 'allow_all_the_time'.tr: 'always'.tr;
    // PermissionStatus locationStatus = await Permission.locationWhenInUse.status;

  }

  static Future<bool> check() async {
    // PermissionStatus locationStatus = await Permission.locationAlways.status;
    //
    // if (!locationStatus.isGranted) {
    // }

    return true;
  }
}