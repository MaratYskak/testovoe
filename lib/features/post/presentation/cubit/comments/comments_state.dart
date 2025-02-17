part of 'comments_cubit.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsInitial extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsLoading extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsLoaded extends CommentsState {
  final List<CommentEntity> comments;

  const CommentsLoaded({required this.comments});
  @override
  List<Object> get props => [comments];
}

class CommentsFailure extends CommentsState {
  @override
  List<Object> get props => [];
}
