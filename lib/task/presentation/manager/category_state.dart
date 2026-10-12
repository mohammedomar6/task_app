part of 'category_cubit.dart';

@immutable
class CategoryState {
  final RequestState<List<CategoryModel>> getCategories;

  final RequestState<void> addCategories;

  final RequestState<void> updateCategories;

  final RequestState<void> deleteCategories;

  const CategoryState({
    this.getCategories = const RequestState(),
    this.addCategories = const RequestState(),
    this.updateCategories = const RequestState(),
    this.deleteCategories = const RequestState(),
  });

  CategoryState copyWith({
    RequestState<List<CategoryModel>>? getCategories,
    RequestState<void>? addCategories,
    RequestState<void>? updateCategories,
    RequestState<void>? deleteCategories,
  }) {
    return CategoryState(
      getCategories: getCategories ?? this.getCategories,
      addCategories: addCategories ?? this.addCategories,
      updateCategories: updateCategories ?? this.updateCategories,
      deleteCategories: deleteCategories ?? this.deleteCategories,
    );
  }
}
