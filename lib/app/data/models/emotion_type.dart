import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmotionType {
  int index;
  String name;
  IconData icon;
  Color color;

  EmotionType(this.index, this.name, this.icon, this.color);

  static List<EmotionType> getEmotions() {
    return [
      EmotionType(1, 'sad',     FontAwesomeIcons.faceFrown,     Colors.blue),
      EmotionType(2, 'angry',   FontAwesomeIcons.faceAngry,     Colors.red),
      EmotionType(3, 'meh',     FontAwesomeIcons.faceMeh,       Colors.brown),
      EmotionType(4, 'happy',   FontAwesomeIcons.faceGrin,      Colors.yellow),
      EmotionType(5, 'excited', FontAwesomeIcons.faceLaughBeam, Colors.green)
    ];
  }

  static EmotionType getEmotionTypeByName(String name) {
    switch (name) {
      case 'sad':     return EmotionType(1, 'sad',     FontAwesomeIcons.faceFrown,     Colors.blue);
      case 'angry':   return EmotionType(2, 'angry',   FontAwesomeIcons.faceAngry,     Colors.red);
      case 'meh':     return EmotionType(3, 'meh',     FontAwesomeIcons.faceMeh,       Colors.brown);
      case 'happy':   return EmotionType(4, 'happy',   FontAwesomeIcons.faceGrin,      Colors.yellow);
      case 'excited': return EmotionType(5, 'excited', FontAwesomeIcons.faceLaughBeam, Colors.green);
    }

    return EmotionType(1, 'sad', FontAwesomeIcons.faceFrown, Colors.blue);
  }
}