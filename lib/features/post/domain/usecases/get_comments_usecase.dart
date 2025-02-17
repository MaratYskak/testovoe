import 'package:testovoe/features/post/domain/entities/comment_entity.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';

class GetCommentsUsecase {
  final PostRepository repository;

  GetCommentsUsecase({required this.repository});

  Stream<List<CommentEntity>> call() {
    return repository.getComments();
  }
}
