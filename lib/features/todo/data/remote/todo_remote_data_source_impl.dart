import 'package:testovoe/features/todo/data/models/todo_model.dart';
import 'package:testovoe/features/todo/data/remote/todo_remote_data_source.dart';
import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  @override
  Stream<List<TodoEntity>> getTodos() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
