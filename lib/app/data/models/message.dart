import 'package:psico_app/app/core/helpers/formatter.dart';

class MessageModel {
  final String messageId;
  final String description;

  MessageModel({
    required this.messageId,
    required this.description
  });

  Map<String, dynamic> toJson() {
    return {
      'messageId': this.messageId,
      'message':   this.description
    };
  }

  static MessageModel fromJson(docId, messageData) {
    return MessageModel(
      messageId:   getString(docId),
      description: getString(messageData['description_br']),
    );
  }
}
