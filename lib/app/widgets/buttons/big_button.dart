import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class BigButton extends StatelessWidget {

  BigButton(this.function, this.icon, this.name);

  final Function()? function;
  final IconData icon;
  final String   name;

  @override
  Widget build(context) {
    return
      SizedBox(
        width: MediaQuery.of(context).size.width * .45,
        height: MediaQuery.of(context).size.height * .15,
        child: ElevatedButton(
            onPressed: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name, style: GoogleFonts.raleway(fontSize: 20)),
                FaIcon(icon, size: 32)
              ],
            )
        ),
      );
  }

}

