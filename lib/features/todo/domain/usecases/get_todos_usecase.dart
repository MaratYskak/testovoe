import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';
import 'package:testovoe/features/todo/domain/repository/todo_repository.dart';

class GetTodosUsecase {
  final TodoRepository repository;

  GetTodosUsecase({required this.repository});

  Stream<List<TodoEntity>> call() {
    return repository.getTodos();
  }
}
