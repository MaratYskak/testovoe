import 'package:testovoe/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Stream<List<UserEntity>> getUsers();
}
