import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrashHelper {
  static void crash(String message, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String identifier = "${prefs.getString('driverId').toString()}_${prefs.getString('itineraryId').toString()}";

    FirebaseCrashlytics.instance.setUserIdentifier(identifier);
    FirebaseCrashlytics.instance.setCustomKey('error_message', message);
    FirebaseCrashlytics.instance.setCustomKey('error_data', data);
    FirebaseCrashlytics.instance.setCustomKey('crash_on', 'itinerary_screen');
    FirebaseCrashlytics.instance.crash();
  }
}