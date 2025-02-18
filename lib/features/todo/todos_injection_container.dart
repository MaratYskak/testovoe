import 'package:testovoe/features/post/data/remote/post_remote_data_source.dart';
import 'package:testovoe/features/post/data/remote/post_remote_data_source_impl.dart';
import 'package:testovoe/features/post/data/repository/post_repository_impl.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';
import 'package:testovoe/features/post/domain/usecases/get_comments_usecase.dart';
import 'package:testovoe/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:testovoe/features/post/presentation/cubit/comments/comments_cubit.dart';
import 'package:testovoe/features/post/presentation/cubit/posts/posts_cubit.dart';
import 'package:testovoe/features/todo/data/remote/todo_remote_data_source.dart';
import 'package:testovoe/features/todo/data/remote/todo_remote_data_source_impl.dart';
import 'package:testovoe/features/todo/data/repository/todo_repository_impl.dart';
import 'package:testovoe/features/todo/domain/repository/todo_repository.dart';
import 'package:testovoe/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:testovoe/features/todo/presentation/cubit/todos_cubit.dart';
import 'package:testovoe/main_injection_container.dart';

Future<void> todosInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<TodosCubit>(() => TodosCubit(getTodosUsecase: sl.call()));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetTodosUsecase>(() => GetTodosUsecase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<TodoRemoteDataSource>(() => TodoRemoteDataSourceImpl());
}
