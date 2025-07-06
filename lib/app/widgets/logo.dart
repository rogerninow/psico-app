import 'package:flutter/material.dart';

import 'package:psico_app/app/core/constants/layout.dart';

class HeaderLogo extends StatelessWidget {

  @override
  Widget build(context) {
    return
    Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Image(
        image: AssetImage(AppFiles.LOGO),
        height: 250,
        width: 250,
      )
    );
  }

}

