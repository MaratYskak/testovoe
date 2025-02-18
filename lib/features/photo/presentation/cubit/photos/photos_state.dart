part of 'photos_cubit.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();
}

class PhotosInitial extends PhotosState {
  @override
  List<Object> get props => [];
}

class PhotosLoading extends PhotosState {
  @override
  List<Object> get props => [];
}

class PhotosLoaded extends PhotosState {
  final List<PhotoEntity> photos;

  const PhotosLoaded({required this.photos});
  @override
  List<Object> get props => [photos];
}

class PhotosFailure extends PhotosState {
  @override
  List<Object> get props => [];
}
