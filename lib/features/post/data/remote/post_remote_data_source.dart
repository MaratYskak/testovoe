import 'package:testovoe/features/post/domain/entities/post_entity.dart';

abstract class PostRemoteDataSource {
  Stream<List<PostEntity>> getPosts();
}
