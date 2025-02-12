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

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };
}
