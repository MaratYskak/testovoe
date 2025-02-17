import 'package:flutter/material.dart';
import 'package:testovoe/features/app/const/page_const.dart';
import 'package:testovoe/features/post/presentation/pages/single_post_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.singlePostPage:
        return materialPageBuilder(SinglePostPage());
      // {
      //   if (args is String) {
      //     return materialPageBuilder(SinglePostPage());
      //   } else {
      //     return materialPageBuilder(const ErrorPage());
      //   }
      // }
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
