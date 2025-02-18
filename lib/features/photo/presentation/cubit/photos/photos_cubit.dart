import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/photo/domain/entities/photo_entity.dart';
import 'package:testovoe/features/photo/domain/usecases/get_photos_usecase.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final GetPhotosUsecase getPhotosUsecase;

  PhotosCubit({required this.getPhotosUsecase}) : super(PhotosInitial());

  Future<void> getPhotos() async {
    try {
      emit(PhotosLoading());
      final streamResponse = getPhotosUsecase.call();
      streamResponse.listen((photos) {
        emit(PhotosLoaded(photos: photos));
      });
    } on SocketException {
      emit(PhotosFailure());
    } catch (_) {
      emit(PhotosFailure());
    }
  }
}
