import 'package:testovoe/features/user/data/models/user_model.dart';
import 'package:testovoe/features/user/data/remote/user_remote_data_source.dart';
import 'package:testovoe/features/user/domain/entities/user_entity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Stream<List<UserEntity>> getUsers() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
