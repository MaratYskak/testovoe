import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testovoe/features/post/data/models/comment_model.dart';
import 'package:testovoe/features/post/data/models/post_model.dart';
import 'package:testovoe/features/post/data/remote/post_remote_data_source.dart';
import 'package:testovoe/features/post/domain/entities/comment_entity.dart';
import 'package:testovoe/features/post/domain/entities/post_entity.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Stream<List<PostEntity>> getPosts() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Stream<List<CommentEntity>> getComments() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
