import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Stream<List<TodoEntity>> getTodos();
}
