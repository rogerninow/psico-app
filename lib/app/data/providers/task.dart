import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:psico_app/app/data/models/task.dart';

class TaskProvider {
  List<TaskModel> _items = [];
  List<TaskModel> get items => [..._items];
  final firestore = FirebaseFirestore.instance;

  Future<List<TaskModel>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String psychologistNumber = prefs.getString('psychologist_number')!;
    String userEmail          = prefs.getString('user_email')!;

    firestore.collection('psychologists').doc(psychologistNumber)
        .collection('patients').doc(userEmail)
        .collection('tasks').snapshots().listen((snapshot)
    {
       for (var doc in snapshot.docs) {
        _items.add(TaskModel.fromJson(doc.id, doc.data()));
       }
    });

    return _items;
  }
}
