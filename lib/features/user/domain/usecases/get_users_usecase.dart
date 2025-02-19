import 'package:testovoe/features/user/domain/entities/user_entity.dart';
import 'package:testovoe/features/user/domain/repository/user_repository.dart';

class GetUsersUsecase {
  final UserRepository repository;

  GetUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getUsers();
  }
}
