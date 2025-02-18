import 'dart:convert';

import 'package:testovoe/features/photo/data/models/album_model.dart';
import 'package:testovoe/features/photo/data/models/photo_model.dart';
import 'package:testovoe/features/photo/data/remote/photo_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:testovoe/features/photo/domain/entities/album_entity.dart';
import 'package:testovoe/features/photo/domain/entities/photo_entity.dart';

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  @override
  Stream<List<AlbumEntity>> getAlbums() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Stream<List<PhotoEntity>> getPhotos() async* {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      yield data.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
