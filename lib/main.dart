import 'package:flutter/material.dart';
import 'package:testovoe/features/app/theme/style.dart';
import 'package:testovoe/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
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
      providers: [],
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
        routes: {},
      ),
    );
  }
}
