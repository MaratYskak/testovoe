import 'package:testovoe/features/photo/data/remote/photo_remote_data_source.dart';
import 'package:testovoe/features/photo/data/remote/photo_remote_data_source_impl.dart';
import 'package:testovoe/features/photo/data/repository/photo_repository_impl.dart';
import 'package:testovoe/features/photo/domain/repository/photo_repository.dart';
import 'package:testovoe/features/photo/domain/usecases/get_albums_usecase.dart';
import 'package:testovoe/features/photo/domain/usecases/get_photos_usecase.dart';
import 'package:testovoe/features/photo/presentation/cubit/albums/albums_cubit.dart';
import 'package:testovoe/features/photo/presentation/cubit/photos/photos_cubit.dart';
import 'package:testovoe/main_injection_container.dart';

Future<void> photosInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<PhotosCubit>(() => PhotosCubit(getPhotosUsecase: sl.call()));

  sl.registerFactory<AlbumsCubit>(() => AlbumsCubit(getAlbumsUsecase: sl.call()));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetPhotosUsecase>(() => GetPhotosUsecase(repository: sl.call()));

  sl.registerLazySingleton<GetAlbumsUsecase>(() => GetAlbumsUsecase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<PhotoRepository>(() => PhotoRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<PhotoRemoteDataSource>(() => PhotoRemoteDataSourceImpl());
}
