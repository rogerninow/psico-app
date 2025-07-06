import 'package:psico_app/app/core/helpers/formatter.dart';

class CrisisPlanModel {
  final String situation;
  final String explanation;

  CrisisPlanModel({
    required this.situation,
    required this.explanation
  });

  Map<String, dynamic> toJson() {
    return {
      'situation':   this.situation,
      'explanation': this.explanation
    };
  }

  static CrisisPlanModel fromJson(messageData) {
    return CrisisPlanModel(
      situation:   getString(messageData['situation']),
      explanation: getString(messageData['explanation'])
    );
  }
}
