import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psico_app/app/data/models/task.dart';

import 'package:psico_app/app/modules/tasks/controller.dart';
import 'package:psico_app/app/widgets/utils/app_bar.dart';

class TasksPage extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    TasksController _ = Get.put(TasksController());

     return Scaffold(
       appBar: DefaultAppBar('tasks_page'.tr, Icons.refresh, _.refreshData),
       body: SingleChildScrollView(child: Column(
         children: [
           Padding(
             padding: EdgeInsetsGeometry.all(20),
             child: Text('tasks_page_info'.tr, style: GoogleFonts.lato(fontSize: 16)),
           ),
           Padding(padding: EdgeInsetsGeometry.only(top: 20)),
           SizedBox(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height * .75,
             child: Obx(() => Column(
               children: [
                 for (TaskModel task in _.list) CheckboxListTile(
                   title: Text(task.description),
                   value: task.completed,
                   onChanged: (value) => _.toggleTask(task.id),
                 )
               ],
             ))
           )
         ],
       ))
     );
  }
}
