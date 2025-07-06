import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:psico_app/app/core/constants/configuration.dart';
import 'package:psico_app/app/core/languages/languages.dart';
import 'package:psico_app/app/modules/login/page.dart';
import 'package:psico_app/app/widgets/utils/restart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );

  tz.initializeTimeZones();

  if (Configuration.DEBUG_MODE == false && Configuration.PRODUCTION == true) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  if (Configuration.PRODUCTION == false) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  runApp(
    RestartWidget(
        child: PsicoApp()
    )
  );
}

class PsicoApp extends StatelessWidget {
  @override
  Widget build(context) {

    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'CA'),
      title: Configuration.APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary:  Configuration.PRODUCTION ? Colors.red : Colors.blue
        ),
      ),
      home: LoginPage(),
      builder: EasyLoading.init(
        builder: (context, child) =>
          MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true
            ),
            child: child!
          )
      ),
    );
  }
}
