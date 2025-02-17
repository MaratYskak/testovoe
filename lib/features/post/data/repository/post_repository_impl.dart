import 'package:testovoe/features/post/data/remote/post_remote_data_source.dart';
import 'package:testovoe/features/post/domain/entities/comment_entity.dart';
import 'package:testovoe/features/post/domain/entities/post_entity.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<PostEntity>> getPosts() => remoteDataSource.getPosts();

  @override
  Stream<List<CommentEntity>> getComments() => remoteDataSource.getComments();
}
