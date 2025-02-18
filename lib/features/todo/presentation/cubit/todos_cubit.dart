import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/post/domain/entities/comment_entity.dart';
import 'package:testovoe/features/post/domain/usecases/get_comments_usecase.dart';
import 'package:testovoe/features/todo/domain/entities/todo_entity.dart';
import 'package:testovoe/features/todo/domain/usecases/get_todos_usecase.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final GetTodosUsecase getTodosUsecase;

  TodosCubit({required this.getTodosUsecase}) : super(TodosInitial());

  Future<void> getTodos() async {
    try {
      emit(TodosLoading());
      final streamResponse = getTodosUsecase.call();
      streamResponse.listen((todos) {
        emit(TodosLoaded(todos: todos));
      });
    } on SocketException {
      emit(TodosFailure());
    } catch (_) {
      emit(TodosFailure());
    }
  }
}
