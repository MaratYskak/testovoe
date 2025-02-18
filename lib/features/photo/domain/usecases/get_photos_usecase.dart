import 'package:testovoe/features/photo/domain/entities/photo_entity.dart';
import 'package:testovoe/features/photo/domain/repository/photo_repository.dart';

class GetPhotosUsecase {
  final PhotoRepository repository;

  GetPhotosUsecase({required this.repository});

  Stream<List<PhotoEntity>> call() {
    return repository.getPhotos();
  }
}
