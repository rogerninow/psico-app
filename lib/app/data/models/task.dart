import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psico_app/app/core/helpers/formatter.dart';

class TaskModel {
  String id;
  String description;
  bool completed = false;
  Timestamp? completedAt;

  TaskModel({
    required this.id,
    required this.description,
    required this.completed,
    this.completedAt
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'description': this.description,
      'completed':   this.completed,
      'completedAt': this.completedAt
    };
  }

  static TaskModel fromJson(id, messageData) {
    return TaskModel(
      id: id,
      description: getString(messageData['description']),
      completed:   getBool(messageData['completed']),
      completedAt: messageData['completed_at'],
    );
  }
}