import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoEntity>> getTodos();
}
