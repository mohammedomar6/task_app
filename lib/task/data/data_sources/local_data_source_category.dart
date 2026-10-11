import 'package:hive_ce/hive.dart';
import 'package:notes_app/task/data/models/category_model.dart';

class LocalDataSourceCategory {
  final Box<CategoryModel> box;

  LocalDataSourceCategory({required this.box});

 Future<void>  addCategory(CategoryModel category)async{
    await box.put(category.id, category);
   }
 Future<void>  updateCategory(CategoryModel category)async{
   await  box.put(category.id, category);
   }
  void deleteCategory(String id)async{
  await box.delete(id);
   }
   List<CategoryModel> getAllCategory(){
  return box.values.toList();
   }
}