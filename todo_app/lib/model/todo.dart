import 'package:flutter/cupertino.dart';
import 'package:todo_app_firestore_example/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  String date;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.date = '',
    this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        date: json['date'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'date': date,
        'id': id,
        'isDone': isDone,
      };
}
