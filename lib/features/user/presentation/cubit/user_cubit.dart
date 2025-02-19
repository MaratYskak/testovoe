import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/user/domain/entities/user_entity.dart';
import 'package:testovoe/features/user/domain/usecases/get_users_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUsecase getUsersUsecase;

  UserCubit({required this.getUsersUsecase}) : super(UsersInitial());

  Future<void> getUsers() async {
    try {
      emit(UsersLoading());

      final streamResponse = getUsersUsecase.call();
      streamResponse.listen((users) {
        emit(UsersLoaded(users: users));
      });
    } on SocketException {
      emit(UsersFailure());
    } catch (_) {
      emit(UsersFailure());
    }
  }
}
