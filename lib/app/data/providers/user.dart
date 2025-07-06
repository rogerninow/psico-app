import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:psico_app/app/data/models/user.dart';

class UserProvider {
  final firestore = FirebaseFirestore.instance;

  Future<UserModel?> loadUserInfo(String userEmail, String psychologistNumber) async {
    UserModel? user;
    var dbData = await firestore.collection('psychologists').doc(psychologistNumber).collection('patients').doc(userEmail).get();

    if (dbData.exists) {
      final data = dbData.data();

      user = UserModel(
          email: userEmail,
          name: data?['name'],
          psychologistId: psychologistNumber
      );
    }

    return user;
  }
}
