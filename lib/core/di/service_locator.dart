import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:notes_app/counter/data/data_sources/local_data_source_counter.dart';
import 'package:notes_app/counter/presentation/manager/counter_provider.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_task.dart';
import 'package:notes_app/task/data/models/task_model.dart';
import 'package:notes_app/task/data/repositories/task_repo.dart';

final s1 = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  final taskBox = await Hive.openBox('task_box');
  final counterBox = await Hive.openBox('counter_box');
  s1.registerSingleton(counterBox);
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
