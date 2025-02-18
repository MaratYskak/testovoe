import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/photo/domain/entities/album_entity.dart';
import 'package:testovoe/features/photo/domain/usecases/get_albums_usecase.dart';

part 'albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  final GetAlbumsUsecase getAlbumsUsecase;

  AlbumsCubit({required this.getAlbumsUsecase}) : super(AlbumsInitial());

  Future<void> getAlbums() async {
    try {
      emit(AlbumsLoading());
      final streamResponse = getAlbumsUsecase.call();
      streamResponse.listen((albums) {
        emit(AlbumsLoaded(albums: albums));
      });
    } on SocketException {
      emit(AlbumsFailure());
    } catch (_) {
      emit(AlbumsFailure());
    }
  }
}
