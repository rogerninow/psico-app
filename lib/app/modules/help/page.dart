import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psico_app/app/data/models/crisis_plan.dart';
import 'package:psico_app/app/modules/help/controller.dart';
import 'package:psico_app/app/widgets/utils/app_bar.dart';

class HelpPage extends GetView<HelpController> {
  @override
  Widget build(context) {
    HelpController _ = Get.put(HelpController());

    return Scaffold(
      appBar: DefaultAppBar('help_page'.tr, Icons.refresh, _.refreshData),
      body: Obx(() => SingleChildScrollView(child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Text('help_page_info'.tr,
              style: GoogleFonts.lato(fontSize: 16)
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .70,
            child: TextField(
              onChanged: (value) => _.filterList(value),
              decoration: InputDecoration(
                  labelText: 'search'.tr,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  )
              ),
            )
          ),
          for (CrisisPlanModel crisisPlan in _.listFiltered)
            Padding(
              padding: EdgeInsetsGeometry.only(top: 10, left: 15, right: 15),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.circleCheck, size: 32),
                title: Text(crisisPlan.situation, style: GoogleFonts.lato(fontSize: 18)),
                subtitle: Text(crisisPlan.explanation, style: GoogleFonts.lato(fontSize: 18)),
                contentPadding: EdgeInsetsGeometry.only(left: 0),
              ),
            )
          ],
      )))
    );
  }
}
