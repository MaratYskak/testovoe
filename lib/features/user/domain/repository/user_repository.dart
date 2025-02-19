import 'package:testovoe/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> getUsers();
}
