import 'package:get_it/get_it.dart';
import 'package:testovoe/features/photo/photos_injection_container.dart';
import 'package:testovoe/features/post/posts_injection_container.dart';
import 'package:testovoe/features/todo/todos_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // final auth = FirebaseAuth.instance;
  // final fireStore = FirebaseFirestore.instance;

  // sl.registerLazySingleton(() => auth);
  // sl.registerLazySingleton(() => fireStore);

  await postsInjectionContainer();
  await photosInjectionContainer();
  await todosInjectionContainer();
}
