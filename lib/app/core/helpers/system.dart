import 'package:psico_app/app/data/providers/driver.dart';

class SystemHelper {

  static Future<void> databaseCheck() async {
    DriverProvider driver = DriverProvider();

    await driver.checkColumns();
  }

}