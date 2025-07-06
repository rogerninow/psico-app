import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/modules/emotions/controller.dart';

class EmotionTile extends StatelessWidget {

  EmotionTile(this.name, this.icon, this.color, this.comment, this.function);

  final String name;
  final IconData icon;
  final Color color;
  final String comment;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    EmotionsController _ = Get.find();

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(100, 10, 100, 10),
      child: ListTile(
        leading: Icon(icon, size: 32, color: color),
        title: Text(name),
        subtitle: Text(comment),
        contentPadding: EdgeInsetsGeometry.only(left: 0),
        trailing: IconButton(
          onPressed: function,
          icon: Icon(
            Icons.highlight_remove_rounded,
            color: Colors.red,
            size: 30
          )
        )
      )
    );
  }
}