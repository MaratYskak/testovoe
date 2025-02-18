import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  final int? id;
  final String? title;
  final bool? completed;

  TodoModel({
    this.id,
    this.title,
    this.completed,
  }) : super(
          id: id,
          title: title,
          completed: completed,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
