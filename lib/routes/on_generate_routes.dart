import 'package:flutter/material.dart';
import 'package:testovoe/features/app/const/page_const.dart';
import 'package:testovoe/features/photo/presentation/pages/single_album_page.dart';
import 'package:testovoe/features/post/presentation/pages/single_post_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.singlePostPage:
        return materialPageBuilder(SinglePostPage(postId_and_post: args as Map<String, Object?>));
      // {
      //   if (args is String) {
      //     return materialPageBuilder(SinglePostPage());
      //   } else {
      //     return materialPageBuilder(const ErrorPage());
      //   }
      // }
      case PageConst.singleAlbumPage:
        final Map<String, Object?> mapa = args as Map<String, Object?>;
        final int id = mapa['albumId'] as int;
        final String title = mapa['title'] as String;
        return materialPageBuilder(SingleAlbumPage(albumId: id, title: title));
    }
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
