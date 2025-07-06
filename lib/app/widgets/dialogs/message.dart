import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/core/helpers/formatter.dart';

class MessageDialog {

  final String title;
  final String content;
  final void Function()? okButtonAction;
  final void Function()? timerAction;
  final Duration? timerDuration;

  MessageDialog(
      this.title,
      this.content,
      this.okButtonAction,
      {
        this.timerAction,
        this.timerDuration
      }
  );

  void show() {
    var timer;

    if (hasValue(timerAction)) {
      timer = Timer(timerDuration!, timerAction!);
    }

    if (Platform.isAndroid) {
      showDialog<void>(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .10,
                child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Text(content, textAlign: TextAlign.start),
                      ),
                    ]
                ),
              ),
              actions: [
                if (okButtonAction != null) TextButton(
                    child: Text('Ok'),
                    onPressed: () => {okButtonAction?.call(), if (timer is Timer) timer.cancel()},
                ),
              ],
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(25),
            );
          }
      );
    }

    if (Platform.isIOS) {
      showCupertinoDialog<void>(
          context: Get.context!,
          builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(content, textAlign: TextAlign.start),
                  ),
                ]
            ),
            actions: [
              if (okButtonAction != null) CupertinoActionSheetAction(
                child: Text('Ok'),
                isDestructiveAction: true,
                onPressed: () => {okButtonAction?.call(), if (timer is Timer) timer.cancel()},
              ),
            ],
          )
      );
    }
  }
}