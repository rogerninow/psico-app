import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:psico_app/app/data/models/crisis_plan.dart';

class CrisisPlanProvider {
  List<CrisisPlanModel> _items = [];
  List<CrisisPlanModel> get items => [..._items];
  final firestore = FirebaseFirestore.instance;

  Future<List<CrisisPlanModel>> loadCrisisPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String psychologistNumber = prefs.getString('psychologist_number')!;
    String userEmail          = prefs.getString('user_email')!;

    var dbData = await firestore.collection('psychologists').doc(psychologistNumber).collection('patients').doc(userEmail).get();
    var data = dbData.data();

    if (data != null) {
      for (var crisisPlan in data['crisis_plan']) {
        _items.add(CrisisPlanModel.fromJson(crisisPlan));
      }
    }

    return _items;
  }
}
