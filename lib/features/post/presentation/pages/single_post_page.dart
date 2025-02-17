import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/post/presentation/cubit/comments/comments_cubit.dart';

class SinglePostPage extends StatefulWidget {
  const SinglePostPage({super.key});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  @override
  void initState() {
    BlocProvider.of<CommentsCubit>(context).getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
      ),
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return Card(
                  color: const Color.fromARGB(255, 34, 59, 102),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.name ?? "Без заголовка",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          comment.body ?? "Нет содержания",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                  SizedBox(height: 16),
                  Text(
                    "Ошибка загрузки comments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
