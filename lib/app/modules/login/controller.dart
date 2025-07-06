import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psico_app/app/core/helpers/dialog.dart';
import 'package:psico_app/app/core/helpers/loader.dart';

import 'package:psico_app/app/core/helpers/permissions.dart';
import 'package:psico_app/app/data/providers/login.dart';
import 'package:psico_app/app/data/providers/user.dart';
import 'package:psico_app/app/modules/main/page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isAuthorized = false;
  double iconSize = 25;
  TextEditingController psychologistNumber = TextEditingController();
  final List<String> scopes = <String>[
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
  UserProvider userProvider = UserProvider();
  LoginProvider loginProvider = LoginProvider();

  @override
  void onInit() async {
    Permissions.check();

    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    LoaderHelper.show();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (psychologistNumber.text == '') {
      Dialogs.showError('psychologist_number_required'.tr);
      return;
    }

    UserCredential? credential = await loginProvider.doLogin();

    if (credential == null || credential.user == null) {
      Dialogs.showError('failed_to_login'.tr);
      return null;
    }

    final user = await userProvider.loadUserInfo(
      "${credential.user?.email}",
      psychologistNumber.text
    );

    if (user == null) {
      Dialogs.showInfo('no_psychologist_warning'.tr);
      return;
    }

    prefs.setString('user_email', "${credential.user?.email}");
    prefs.setString('psychologist_number', psychologistNumber.text);

    Get.offAll(() => MainPage());
    await Dialogs.showSuccess('successfully_logged_in'.tr);

    return Future.value();
  }

  void signOut() async {
    await _auth.signOut();
  }
}