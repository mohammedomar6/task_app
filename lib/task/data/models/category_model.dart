import 'package:hive_ce/hive.dart';
part 'category_model.g.dart';
@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String priority;
  @HiveField(4)
  final String subTitle;

  CategoryModel( {required this.subTitle,required this.id, required this.name, required this.image, required this.priority});

}