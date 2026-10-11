import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/core/errors/failures.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_task.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app/task/data/models/task_model.dart';
class TaskRepo {
    final LocalDataSourceTask localDataSourceTask;

  TaskRepo({required this.localDataSourceTask});
   Either<Failure,Unit> addTask(TaskModel task){
       try {
         localDataSourceTask.addTask(task);
         return Right(unit);
       } on TaskAlreadyExistsException catch (e) {
         return Left(TaskAlreadyExistsFailure(e.message));
       }
   }
   void updateTask(TaskModel task){

        localDataSourceTask.updateTask(task);


    }
   List<TaskModel> getTasks(){

      return  localDataSourceTask.getTasks();


    }
    TaskModel? getTasksById(String id){

      return  localDataSourceTask.getTaskById(id);


    }
   Either<Failure,Unit> deleteTask(String id){

        try {
          localDataSourceTask.deleteTask(id);
          return Right(unit);
        } on TaskNotFoundException catch (e) {
          return Left(TaskNotFoundFailure(e.message));
        }


    }
}