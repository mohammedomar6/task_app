import 'package:dartz/dartz.dart';
import 'package:hive_ce/hive.dart';

import 'package:notes_app/core/errors/failures.dart';
import 'package:notes_app/task/data/data_sources/local_data_source_category.dart';
import 'package:notes_app/task/data/models/category_model.dart';

class CategoryRepo {
  final LocalDataSourceCategory localDataSourceCategory;

  CategoryRepo({
    required this.localDataSourceCategory,
  });

  // ADD CATEGORY
  Future<Either<Failure, Unit>> addCategory(CategoryModel category,) async {
    try {
      await localDataSourceCategory.addCategory(category);

      return Right(unit);
    } on HiveError {
      return Left(CategoryFailure('فشل حفظ التصنيف'));
    } on Exception {
      return Left(CategoryFailure('تعذرت إضافة التصنيف'));
    }
  }

  // UPDATE CATEGORY
  Future<Either<Failure, Unit>> updateCategory(
      CategoryModel category,
      ) async {
    try {
      await localDataSourceCategory.updateCategory(category);

      return Right(unit);
    } on HiveError {
      return Left(CategoryFailure('فشل تعديل التصنيف'));
    } on Exception {
      return Left(CategoryFailure('تعذر تعديل التصنيف'));
    }
  }

  // DELETE CATEGORY
  Future<Either<Failure, Unit>> deleteCategory(
      String id,
      ) async {
    try {
      await localDataSourceCategory.deleteCategory(id);

      return Right(unit);
    } on HiveError {
      return Left(CategoryFailure('فشل حذف التصنيف'));
    } on Exception {
      return Left(CategoryFailure('تعذر حذف التصنيف'));
    }
  }

  // GET ALL CATEGORIES
  Either<Failure, List<CategoryModel>> getAllCategory() {
    try {
      final categories =
      localDataSourceCategory.getAllCategory();

      return Right(categories);
    } on HiveError {
      return Left(CategoryFailure('فشل قراءة التصنيفات'));
    } on Exception {
      return Left(CategoryFailure('تعذر جلب التصنيفات'));
    }
  }
}