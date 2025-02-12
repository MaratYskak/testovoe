import 'package:testovoe/features/post/domain/entities/post_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel extends PostEntity {
  final int? id;
  final String? title;
  final String? body;

  PostModel({
    this.id,
    this.title,
    this.body,
  }) : super(
          id: id,
          title: title,
          body: body,
        );

  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return PostModel(
      id: snap['id'] ?? -1,
      title: snap['title'] ?? 'no title',
      body: snap['body'] ?? 'no body',
    );
  }

  Map<String, dynamic> toDocument() => {
        "id": id,
        "title": title,
        "body": body,
      };
}
