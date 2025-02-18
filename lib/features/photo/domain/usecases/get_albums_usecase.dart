import 'package:testovoe/features/photo/domain/entities/album_entity.dart';
import 'package:testovoe/features/photo/domain/repository/photo_repository.dart';

class GetAlbumsUsecase {
  final PhotoRepository repository;

  GetAlbumsUsecase({required this.repository});

  Stream<List<AlbumEntity>> call() {
    return repository.getAlbums();
  }
}
