import 'package:get/get.dart';

import 'package:psico_app/app/data/models/contact.dart';

class ContactsController extends GetxController {
  RxList<Contact> list = <Contact>[
    Contact('Roger', '47988291690'),
    Contact('Alguém', '51999999999'),
  ].obs;

  @override
  void onReady() async {
    super.onReady();

  }

  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
  }

  Future<void> addContact(String name, String phone) async {
    list.add(Contact(name, phone));
  }

  Future<void> removeContact(String phone) async {
    list.removeWhere((Contact contact) => contact.phoneNumber == phone);
  }
}