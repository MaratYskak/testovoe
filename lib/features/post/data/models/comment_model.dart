import 'package:testovoe/features/post/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  }) : super(
          postId: postId,
          id: id,
          name: name,
          email: email,
          body: body,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
