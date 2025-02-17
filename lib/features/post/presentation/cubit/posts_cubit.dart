import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:testovoe/features/post/domain/entities/post_entity.dart';
import 'package:testovoe/features/post/domain/usecases/get_posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUsecase getPostsUsecase;

  PostsCubit({required this.getPostsUsecase}) : super(PostsInitial());

  Future<void> getPosts() async {
    try {
      emit(PostsLoading());
      print('ПОСТЫ ГРУЗЯТСЯ');

      final streamResponse = getPostsUsecase.call();
      streamResponse.listen((posts) {
        emit(PostsLoaded(posts: posts));
      });
    } on SocketException {
      print('ВОТ ЭТА ОШИБКА');
      emit(PostsFailure());
    } catch (_) {
      emit(PostsFailure());
    }
  }
}
