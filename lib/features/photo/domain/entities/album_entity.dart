import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final int? id;
  final String? title;

  const AlbumEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
