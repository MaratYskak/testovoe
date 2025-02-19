part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UsersInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends UserState {
  final List<UserEntity> users;

  const UsersLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class UsersFailure extends UserState {
  @override
  List<Object> get props => [];
}
