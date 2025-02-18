import 'package:testovoe/features/photo/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  final int? id;
  final String? title;

  AlbumModel({
    this.id,
    this.title,
  }) : super(
          id: id,
          title: title,
        );

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
