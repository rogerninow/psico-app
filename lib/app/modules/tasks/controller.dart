import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:psico_app/app/core/helpers/loader.dart';

import 'package:psico_app/app/data/models/task.dart';
import 'package:psico_app/app/data/providers/task.dart';

class TasksController extends GetxController {
  TaskProvider provider = TaskProvider();
  RxList<TaskModel> list = <TaskModel>[].obs;

  void toggleTask(String id) {
    int index =  list.indexWhere((TaskModel task) =>  task.id == id);
    list[index].completed = !list[index].completed;
    list[index].completedAt = Timestamp.now();
    list.refresh();
  }
  @override
  void onReady() async {
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
    LoaderHelper.show();

    list.clear();
    list.value = await provider.loadTasks();
    list.refresh();

    LoaderHelper.dismiss();
  }
}