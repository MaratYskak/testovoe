import 'package:testovoe/features/post/data/remote/post_remote_data_source.dart';
import 'package:testovoe/features/post/data/remote/post_remote_data_source_impl.dart';
import 'package:testovoe/features/post/data/repository/post_repository_impl.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';
import 'package:testovoe/features/post/domain/usecases/get_comments_usecase.dart';
import 'package:testovoe/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:testovoe/features/post/presentation/cubit/comments/comments_cubit.dart';
import 'package:testovoe/features/post/presentation/cubit/posts/posts_cubit.dart';
import 'package:testovoe/features/user/data/remote/user_remote_data_source.dart';
import 'package:testovoe/features/user/data/remote/user_remote_data_source_impl.dart';
import 'package:testovoe/features/user/data/repository/user_repository_impl.dart';
import 'package:testovoe/features/user/domain/repository/user_repository.dart';
import 'package:testovoe/features/user/domain/usecases/get_users_usecase.dart';
import 'package:testovoe/features/user/presentation/cubit/user_cubit.dart';
import 'package:testovoe/main_injection_container.dart';

Future<void> usersInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<UserCubit>(() => UserCubit(getUsersUsecase: sl.call()));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetUsersUsecase>(() => GetUsersUsecase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
}
