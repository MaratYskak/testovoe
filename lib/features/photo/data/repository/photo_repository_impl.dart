import 'package:testovoe/features/photo/data/remote/photo_remote_data_source.dart';
import 'package:testovoe/features/photo/domain/entities/album_entity.dart';
import 'package:testovoe/features/photo/domain/entities/photo_entity.dart';
import 'package:testovoe/features/photo/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<AlbumEntity>> getAlbums() => remoteDataSource.getAlbums();

  @override
  Stream<List<PhotoEntity>> getPhotos() => remoteDataSource.getPhotos();
}
