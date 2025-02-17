import 'package:testovoe/features/post/data/remote/post_remote_data_source.dart';
import 'package:testovoe/features/post/data/remote/post_remote_data_source_impl.dart';
import 'package:testovoe/features/post/data/repository/post_repository_impl.dart';
import 'package:testovoe/features/post/domain/repository/post_repository.dart';
import 'package:testovoe/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:testovoe/features/post/presentation/cubit/posts/posts_cubit.dart';
import 'package:testovoe/main_injection_container.dart';

Future<void> postsInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<PostsCubit>(() => PostsCubit(getPostsUsecase: sl.call()));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetPostsUsecase>(() => GetPostsUsecase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl());
}
