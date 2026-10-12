import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/core/errors/failures.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_task.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app/task/data/models/task_model.dart';
class TaskRepo {
  final LocalDataSourceTask localDataSourceTask;

  TaskRepo({required this.localDataSourceTask});
  Future <Either<Failure,Unit>> addTask(TaskModel task)async{
       try {
        await localDataSourceTask.addTask(task);
         return Right(unit);
       } on TaskAlreadyExistsException catch (e) {
         return Left(TaskAlreadyExistsFailure(e.message));
       }
   }
  Future<Either<Failure,Unit>> updateTask(TaskModel task)async{

       try {
         await localDataSourceTask.updateTask(task);
         return Right(unit);
       } on TaskNotFoundException catch (e) {
         return Left(TaskNotFoundFailure(e.message));
       }


    }
  Either<Failure,List<TaskModel>>getTasks(){

       try {
         final data=  localDataSourceTask.getTasks();
         return Right(data);
       } on Exception catch (e) {
        return Left(CacheFailure(e.toString()));
       }


    }
   Either<Failure,TaskModel?>  getTasksById(String id){

      try {
        final data=  localDataSourceTask.getTaskById(id);
        return Right(data);
      } on Exception catch (e) {
        return Left(CacheFailure(e.toString()));
      }


    }
  Future <Either<Failure,Unit>> deleteTask(String id)async{
        try {
         await localDataSourceTask.deleteTask(id);
          return Right(unit);
        } on TaskNotFoundException catch (e) {
          return Left(TaskNotFoundFailure(e.message));
        }


    }
}