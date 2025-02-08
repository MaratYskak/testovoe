import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      // case PageConst.contactUsersPage:
      //   {
      //     if(args is String) {
      //       return materialPageBuilder(ContactsPage(uid: args,));

      //     } else {
      //       return materialPageBuilder( const ErrorPage());

      //     }
      //   }
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
