import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psico_app/app/data/models/contact.dart';

import 'package:psico_app/app/modules/contacts/controller.dart';
import 'package:psico_app/app/modules/contacts/widgets/add_contact.dart';
import 'package:psico_app/app/widgets/utils/app_bar.dart';

class ContactsPage extends GetView<ContactsController> {
  @override
  Widget build(context) {
    ContactsController _ = Get.put(ContactsController());

     return Scaffold(
       appBar: DefaultAppBar('contacts_page'.tr, Icons.add, () => AddContactDialog.show()),
       body: Obx(() => Column(
         children: [
           Padding(
             padding: EdgeInsetsGeometry.all(20),
             child: Text('contacts_page_info'.tr, style: GoogleFonts.lato(fontSize: 16)),
           ),
           for (Contact contact in _.list)
             Padding(
               padding: EdgeInsetsGeometry.fromLTRB(100, 10, 100, 10),
               child: ListTile(
                 leading: CircleAvatar(
                   child: Icon(Icons.person),
                 ),
                 title: Text(contact.name),
                 subtitle: Text(contact.phoneNumber),
                 contentPadding: EdgeInsetsGeometry.only(left: 0),
                 trailing: IconButton(
                   onPressed: () => _.removeContact(contact.phoneNumber),
                   icon: Icon(
                     Icons.highlight_remove_rounded,
                     color: Colors.red,
                     size: 30
                   )
                 )
               )
             )
         ]
       ))
     );
  }
}
