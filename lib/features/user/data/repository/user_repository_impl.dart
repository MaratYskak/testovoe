import 'package:testovoe/features/user/data/remote/user_remote_data_source.dart';
import 'package:testovoe/features/user/domain/entities/user_entity.dart';
import 'package:testovoe/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<UserEntity>> getUsers() => remoteDataSource.getUsers();
}
