import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psico_app/app/data/models/message.dart';

class MessageProvider {
  List<MessageModel> _items = [];
  List<MessageModel> get items => [..._items];

  Future<List<MessageModel>> loadMessages() async {
    FirebaseFirestore.instance.collection('app_messages').snapshots().listen((snapshot) {
       for (var doc in snapshot.docs) {
        _items.add(MessageModel.fromJson(doc.id, doc.data()));
       }
    });

    return _items;
  }
}
