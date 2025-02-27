import 'package:flutter/material.dart';
import 'package:testovoe/features/app/home/home_page.dart';
import 'package:testovoe/features/app/theme/style.dart';
import 'package:testovoe/features/photo/presentation/cubit/albums/albums_cubit.dart';
import 'package:testovoe/features/photo/presentation/cubit/photos/photos_cubit.dart';
import 'package:testovoe/features/post/presentation/cubit/comments/comments_cubit.dart';
import 'package:testovoe/features/post/presentation/cubit/posts/posts_cubit.dart';
import 'package:testovoe/features/todo/presentation/cubit/todos_cubit.dart';
import 'package:testovoe/features/user/presentation/cubit/user_cubit.dart';
import 'package:testovoe/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PostsCubit>()..getPosts(),
        ),
        BlocProvider(
          create: (context) => di.sl<CommentsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AlbumsCubit>()..getAlbums(),
        ),
        BlocProvider(
          create: (context) => di.sl<PhotosCubit>()..getPhotos(),
        ),
        BlocProvider(
          create: (context) => di.sl<TodosCubit>()..getTodos(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>()..getUsers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: tabColor, brightness: Brightness.dark),
          scaffoldBackgroundColor: backgroundColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            // return BlocBuilder<PostsCubit, PostsState>(
            //   builder: (context, state) {
            //     if (state is PostsLoaded) {
            //       return PostsPage();
            //     } else {
            //       Center(
            //         child: Text(
            //           'posts failed to load',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       );
            //     }
            //     return const SizedBox();
            //   },
            // );
            return HomePage();
          },
        },
      ),
    );
  }
}
