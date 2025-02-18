import 'package:testovoe/features/photo/domain/entities/album_entity.dart';
import 'package:testovoe/features/photo/domain/entities/photo_entity.dart';

abstract class PhotoRemoteDataSource {
  Stream<List<AlbumEntity>> getAlbums();
  Stream<List<PhotoEntity>> getPhotos();
}
