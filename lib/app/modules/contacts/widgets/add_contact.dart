import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psico_app/app/modules/contacts/controller.dart';

import 'package:psico_app/app/widgets/dialogs/generic.dart';

class AddContactDialog {

  static void show() {
    ContactsController _ = Get.find();

    TextEditingController nameField  = TextEditingController();
    TextEditingController phoneField = TextEditingController();

    GenericDialog(
     'add_contact_title'.tr,
      Padding(
        padding: EdgeInsetsGeometry.only(bottom: 25),
        child: Text(
          'add_contact_info'.tr,
          textAlign: TextAlign.start
        ),
      ),
      () async {
        Navigator.pop(Get.context!);
        _.addContact(nameField.text, phoneField.text);
      },
      middleComponent: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: 50,
            child:  TextField(
              controller: nameField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name'.tr,
              ),
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: 50,
            child:  TextField(
              controller: phoneField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phone_number'.tr,
              ),
            ),
          ),
        ],
      ),
      okButtonText: 'save'.tr,
      secondaryButtonAction: () async {
        Navigator.pop(Get.context!);
      },
      secondaryButtonText: 'cancel'.tr,
      size: MediaQuery.of(Get.context!).size.height * 0.30
    ).show();
  }
}