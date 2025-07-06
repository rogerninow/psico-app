import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:psico_app/app/core/helpers/dialog.dart';

class LoginProvider {
  late GoogleSignInAccount? googleUser;

  Future<UserCredential?> doLogin() async {
    googleUser = await GoogleSignIn(serverClientId: '60681316022-sk21hutng22baokh2834fc46vsnp4qfn.apps.googleusercontent.com').signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credentialProvider = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithCredential(
          credentialProvider
      );

      return credential;
    } on FirebaseAuthException catch (e) {

      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          Dialogs.showError('invalid_credentials'.tr);
          break;
      }
    }

    return null;
  }

  Future<void> doLogout() async {
  }
}