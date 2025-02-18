part of 'albums_cubit.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();
}

class AlbumsInitial extends AlbumsState {
  @override
  List<Object> get props => [];
}

class AlbumsLoading extends AlbumsState {
  @override
  List<Object> get props => [];
}

class AlbumsLoaded extends AlbumsState {
  final List<AlbumEntity> albums;

  const AlbumsLoaded({required this.albums});
  @override
  List<Object> get props => [albums];
}

class AlbumsFailure extends AlbumsState {
  @override
  List<Object> get props => [];
}
