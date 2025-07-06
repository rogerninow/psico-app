import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psico_app/app/data/models/message.dart';

import 'package:psico_app/app/modules/main/controller.dart';
import 'package:psico_app/app/modules/main/widgets/carousel.dart';
import 'package:psico_app/app/widgets/buttons/big_button.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(context) {
    MainController _ = Get.put(MainController());

     return Scaffold(
       appBar: AppBar(
         title: Center(child: Text('home_page'.tr)),
       ),
       body:  Column(
         children: [
           Padding(
             padding: EdgeInsets.all(10),
             child: Column(
               children: [
                 Obx(() => Carousel(
                   [
                     for (MessageModel message in _.messages)
                       Text(
                        message.description,
                         textAlign: TextAlign.justify,
                         style: GoogleFonts.lato(fontSize: 16),
                       )
                   ]
                 )),
                 Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     BigButton(
                       _.refreshData,
                       FontAwesomeIcons.download, 'download'.tr
                     ),
                     BigButton(
                      () => _.goToPage('help'),
                      FontAwesomeIcons.handHoldingMedical, 'need_help'.tr
                     ),
                   ],
                 ),
                 Padding(
                   padding: EdgeInsets.only(
                     bottom: MediaQuery.of(context).size.height * .03,
                     top: MediaQuery.of(context).size.height * .03,
                   ),
                   child: Center(
                       child: Text(
                           'Other options',
                           style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w500)
                       )
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     BigButton(
                       () => _.goToPage('questionnaire'),
                       FontAwesomeIcons.clipboardQuestion, 'questionnaire'.tr
                     ),
                     BigButton(
                      () => _.goToPage('tasks'),
                      FontAwesomeIcons.listCheck, 'task_list'.tr
                     )
                   ],
                 ),
                 Padding(
                     padding: EdgeInsetsGeometry.only(
                         top: MediaQuery.of(context).size.height * .02
                     )
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     BigButton(
                       () => _.goToPage('contacts'),
                       FontAwesomeIcons.addressBook, 'contacts'.tr
                     ),
                     BigButton(
                       () => _.goToPage('emotions'),
                       FontAwesomeIcons.faceSmile, 'emotions'.tr
                     )
                   ],
                 ),
               ],
             )
           ),
         ],
       )
     );
  }
}
