import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psico_app/app/core/constants/configuration.dart';
import 'package:psico_app/app/core/constants/layout.dart';
import 'package:psico_app/app/modules/login/controller.dart';
import 'package:psico_app/app/widgets/logo.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Color(0xFFEFF3F6),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width * 0.25)),
          HeaderLogo(),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            Configuration.APP_TITLE,
            style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
              left: MediaQuery.of(context).size.height * .05,
              right: MediaQuery.of(context).size.height * .05,
            ),
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.headSideVirus, size: controller.iconSize, color: Colors.teal),
                  Icon(FontAwesomeIcons.brain, size: controller.iconSize, color: Colors.teal),
                  Icon(FontAwesomeIcons.heart, size: controller.iconSize, color: Colors.teal),
                  Icon(FontAwesomeIcons.gears, size: controller.iconSize, color: Colors.teal),
                ],
              )
          ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .08)),
          SizedBox(
            width: MediaQuery.of(context).size.width * .60,
            child: TextField(
            controller: controller.psychologistNumber,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(
              labelText: 'psychologist_number'.tr,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              )
            )),
          ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .04)),
          SizedBox(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage(AppFiles.GOOGLE),
                    height: 25,
                    width: 25,
                  ),
                  Text('sign_with_google'.tr, style: TextStyle(fontSize: 18, color: Colors.teal)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              onPressed: controller.signInWithGoogle,
            ),
            width: MediaQuery.of(context).size.width * 0.60,
          )
        ],
      )),
    );
  }
}