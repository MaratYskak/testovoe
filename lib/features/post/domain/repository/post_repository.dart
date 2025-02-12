import 'package:testovoe/features/post/domain/entities/post_entity.dart';

abstract class PostRepository {
  Stream<List<PostEntity>> getPosts(PostEntity post);
}
