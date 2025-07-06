import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/core/helpers/formatter.dart';

class GenericDialog {

  final String title;
  final Widget content;
  final String? okButtonText;
  final String? secondaryButtonText;
  final TextField? textField;
  final void Function()? okButtonAction;
  final void Function()? secondaryButtonAction;
  final void Function()? textFieldAction;
  final void Function()? timerAction;
  final Duration? timerDuration;
  final middleComponent;
  final topComponent;
  final double? size;
  final String? style;

  GenericDialog(
      this.title,
      this.content,
      this.okButtonAction,
      {
        this.okButtonText,
        this.secondaryButtonAction,
        this.secondaryButtonText,
        this.timerAction,
        this.timerDuration,
        this.textField,
        this.textFieldAction,
        this.middleComponent,
        this.topComponent,
        this.size,
        this.style
      }
  );

  void show() {

    var timer;

    if (hasValue(timerAction)) {
      timer = Timer(timerDuration!, timerAction!);
    }

    if (Platform.isAndroid || style == 'ANDROID') {
      showDialog<void>(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: hasValue(size) ? size : MediaQuery.of(context).size.height * 0.50,
                child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: content,
                      ),
                      if (hasValue(topComponent))
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: topComponent!,
                          ),
                        ),
                      if (hasValue(textField)) Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: textField!,
                      ),
                      if (hasValue(middleComponent)) SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: middleComponent!,
                        ),
                      ),
                    ]
                ),
              ),
              actions: [
                if (hasValue(secondaryButtonAction)) TextButton(
                    child: Text(secondaryButtonText!),
                    onPressed: () => {secondaryButtonAction!.call(), if (timer is Timer) timer.cancel()},
                ),
                if (okButtonAction != null) TextButton(
                    child: hasValue(okButtonText) ? Text(okButtonText!) : Text('Ok'),
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

    if (Platform.isIOS && style != 'ANDROID') {
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
                    child: content,
                  ),
                  if (hasValue(topComponent))
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: topComponent!,
                      ),
                    ),
                  if (hasValue(textField)) Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: textField!,
                  ),
                  if (hasValue(middleComponent)) SizedBox(
                    width: double.infinity,
                    height: hasValue(topComponent) ? 90 : 300,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: middleComponent!,
                    ),
                  )
                ]
            ),
            actions: [
              if (hasValue(secondaryButtonAction)) CupertinoActionSheetAction(
                  child: Text(secondaryButtonText!),
                  isDestructiveAction: true,
                  onPressed: () => {secondaryButtonAction!.call(), if (timer is Timer) timer.cancel()},
              ),
              if (okButtonAction != null) CupertinoActionSheetAction(
                child: hasValue(okButtonText) ? Text(okButtonText!) : Text('Ok'),
                isDestructiveAction: true,
                onPressed: () => {okButtonAction?.call(), if (timer is Timer) timer.cancel()},
              ),
            ],
          )
      );
    }
  }
}