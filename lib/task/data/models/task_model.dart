import 'package:hive_ce/hive_ce.dart';
import 'package:notes_app/task/data/models/category_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isCompleted;

  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final CategoryModel categoryModel;
  @HiveField(5)
  final DateTime due;

  const TaskModel(
      {
     required   this.due,
        required this.id,
    required this.title,
    required this.categoryModel,
    this.isCompleted = false,
    required this.createdAt,
  });
}