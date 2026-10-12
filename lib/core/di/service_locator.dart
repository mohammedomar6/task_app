import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:notes_app/counter/data/data_sources/local_data_source_counter.dart';
import 'package:notes_app/counter/presentation/manager/counter_provider.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_category.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_task.dart';
import 'package:notes_app/task/data/models/category_model.dart';
import 'package:notes_app/task/data/models/task_model.dart';
import 'package:notes_app/task/data/repositories/category_repo.dart';
import 'package:notes_app/task/data/repositories/task_repo.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';

final s1 = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  final taskBox = await Hive.openBox<TaskModel>('task_box');
  final categoryBox = await Hive.openBox<CategoryModel>('category_box');
  final counterBox = await Hive.openBox<dynamic>('counter_box');
  s1.registerSingleton(counterBox);
  s1.registerSingleton(categoryBox);

  s1.registerLazySingleton<LocalDataSourceCategory>(
    () => LocalDataSourceCategory(box: s1<Box<CategoryModel>>()),
  );
  s1.registerLazySingleton<CategoryRepo>(
    () => CategoryRepo(localDataSourceCategory: s1<LocalDataSourceCategory>()),
  );
  s1.registerFactory<CategoryCubit>(() => CategoryCubit(s1<CategoryRepo>()),);
  s1.registerLazySingleton<LocalDataSourceCounter>(
    () => LocalDataSourceCounter(box: s1<Box<dynamic>>()),
  );
  s1.registerFactory<CounterProvider>(
    () => CounterProvider(localDataSourceCounter: s1<LocalDataSourceCounter>()),
  );
  s1.registerSingleton(taskBox);
  s1.registerLazySingleton<LocalDataSourceTask>(
    () => LocalDataSourceTask(box: s1<Box<TaskModel>>()),
  );
  s1.registerLazySingleton<TaskRepo>(
    () => TaskRepo(localDataSourceTask: s1<LocalDataSourceTask>()),
  );
}
