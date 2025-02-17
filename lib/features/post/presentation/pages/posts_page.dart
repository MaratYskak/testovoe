import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/post/presentation/cubit/posts_cubit.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // @override
  // void initState() {
  //   BlocProvider.of<PostsCubit>(context).getPosts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return Card(
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
                          post.title ?? "Без заголовка",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          post.body ?? "Нет содержания",
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
                    "Ошибка загрузки постов",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );

    // Scaffold(
    //   body: BlocBuilder<PostsCubit, PostsState>(
    //     builder: (BuildContext context, state) {
    //       if (state is PostsLoaded) {
    //         return ListView.builder(
    //           itemCount: state.posts.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             final post = state.posts[index];
    //             return Text(post.body ?? "post.body == null");
    //           },
    //         );
    //       } else {
    //         return Center(child: Text("state is not PostsLoaded xD"));
    //       }
    //     },
    //   ),
    // );
  }
}
