import 'package:hive_ce/hive.dart';
import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/task/data/models/category_model.dart';

class LocalDataSourceCategory {
  final Box<CategoryModel> box;

  LocalDataSourceCategory({required this.box});

 Future<void>  addCategory(CategoryModel category)async{
   if(box.containsKey(category.id)){
     throw TaskAlreadyExistsException();
   }
    await box.put(category.id, category);
   }
 Future<void>  updateCategory(CategoryModel category)async{
   if(!box.containsKey(category.id)){
     throw TaskNotFoundException();
   }
   await  box.put(category.id, category);
   }
 Future <void> deleteCategory(String id)async{
   if(!box.containsKey(id)){
     throw TaskNotFoundException();
   }
  await box.delete(id);
   }
   List<CategoryModel> getAllCategory(){
  return box.values.toList();
   }
}