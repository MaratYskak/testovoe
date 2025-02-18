import 'package:testovoe/features/todo/data/remote/todo_remote_data_source.dart';
import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';
import 'package:testovoe/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<TodoEntity>> getTodos() => remoteDataSource.getTodos();
}
