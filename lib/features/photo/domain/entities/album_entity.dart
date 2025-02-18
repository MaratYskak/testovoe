import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final int? id;
  final String? title;

  const AlbumEntity(this.id, this.title);

  @override
  List<Object?> get props => [id, title];
}
