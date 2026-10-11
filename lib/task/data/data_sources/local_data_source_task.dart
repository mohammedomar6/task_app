import 'package:hive_ce/hive.dart';
import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/task/data/models/task_model.dart';

class LocalDataSourceTask {
 final    Box<TaskModel> box ;

  LocalDataSourceTask({required this.box});
  int getNumTasks(){
    return box.length;
  }
     Future<void> addTask(TaskModel task )async{


           if(box.containsKey(task.id)){
             throw TaskAlreadyExistsException();
           }

      await box.put(task.id, task);
     }
     Future<void> updateTask(TaskModel task)async{
    if(!box.containsKey(task.id)){
      throw TaskNotFoundException();
    }
     await  box.put(task.id, task);

     }
     Future<void> deleteTask(String id )async{

            if(!box.containsKey(id)){
               throw TaskNotFoundException();
            }

        await box.delete(id);
     }
     List<TaskModel> getTasks(){
      return   box.values.toList();
     }
     TaskModel? getTaskById(String id ){
      return box.get(id);

     }
}