import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/post/domain/entities/comment_entity.dart';
import 'package:testovoe/features/post/domain/usecases/get_comments_usecase.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final GetCommentsUsecase getCommentsUsecase;

  CommentsCubit({required this.getCommentsUsecase}) : super(CommentsInitial());

  Future<void> getComments() async {
    try {
      emit(CommentsLoading());
      final streamResponse = getCommentsUsecase.call();
      streamResponse.listen((comments) {
        emit(CommentsLoaded(comments: comments));
      });
    } on SocketException {
      emit(CommentsFailure());
    } catch (_) {
      emit(CommentsFailure());
    }
  }
}
