
import 'package:get_it/get_it.dart';
import 'package:todoapps/application/pages/add_page/cubit/detail_cubit.dart';
import 'package:todoapps/application/pages/home_page/cubit/todo_cubit.dart';
import 'package:todoapps/data/datasources/local/app_database.dart';
import 'package:todoapps/data/repositories/todo_repo_impl.dart';
import 'package:todoapps/domain/repositories/todo_repo.dart';
import 'package:todoapps/domain/usecases/todo_usecase.dart';

final sl = GetIt.I;

Future<void> init()async{
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => DetailCubit(sl()));

  sl.registerFactory(() => TodoUseCase(sl()));

  sl.registerFactory<ToDoRepository>(() => ToDoRepositoryImpl(sl()));
}