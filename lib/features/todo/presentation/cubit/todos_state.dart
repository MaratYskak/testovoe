part of 'todos_cubit.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosState {
  final List<TodoEntity> todos;

  const TodosLoaded({required this.todos});
  @override
  List<Object> get props => [todos];
}

class TodosFailure extends TodosState {
  @override
  List<Object> get props => [];
}
