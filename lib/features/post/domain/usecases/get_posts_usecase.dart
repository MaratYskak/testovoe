import 'package:testovoe/features/post/domain/entities/post_entity.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';

class GetPostsUsecase {
  final PostRepository repository;

  GetPostsUsecase({required this.repository});

  Stream<List<PostEntity>> call() {
    return repository.getPosts();
  }
}
