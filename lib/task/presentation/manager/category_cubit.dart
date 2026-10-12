import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/core/state/request_state.dart';
import 'package:notes_app/task/data/models/category_model.dart';
import 'package:notes_app/task/data/repositories/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo) : super(CategoryState());

  void getAllCategory() {
    emit(state.copyWith(getCategories: RequestState(status: Status.loading)));
    final res = categoryRepo.getAllCategory();
    res.fold(
      (l) => emit(
        state.copyWith(
          getCategories: RequestState(status: Status.error, error: l.message),
        ),
      ),
      (r) => emit(
        state.copyWith(
          getCategories: RequestState(status: Status.success, data: r),
        ),
      ),
    );
  }

  void addCategory(CategoryModel category) async {
    emit(state.copyWith(addCategories: RequestState(status: Status.loading)));
    final res = await categoryRepo.addCategory(category);
    res.fold(
      (l) => emit(
        state.copyWith(
          addCategories: RequestState(status: Status.error, error: l.message),
        ),
      ),
      (r) => emit(
        state.copyWith(addCategories: RequestState(status: Status.success)),
      ),
    );
  }

  void updateCategory(CategoryModel category) async {
    emit(
      state.copyWith(updateCategories: RequestState(status: Status.loading)),
    );
    final res = await categoryRepo.updateCategory(category);
    res.fold(
      (l) => emit(
        state.copyWith(
          updateCategories: RequestState(
            status: Status.error,
            error: l.message,
          ),
        ),
      ),
      (r) => emit(
        state.copyWith(updateCategories: RequestState(status: Status.success)),
      ),
    );
  }
  void deleteCategory(String id) async {
    emit(
      state.copyWith(deleteCategories: RequestState(status: Status.loading)),
    );
    final res = await categoryRepo.deleteCategory(id);
    res.fold(
      (l) => emit(
        state.copyWith(
          deleteCategories: RequestState(
            status: Status.error,
            error: l.message,
          ),
        ),
      ),
      (r) => emit(
        state.copyWith(deleteCategories: RequestState(status: Status.success)),
      ),
    );
  }
}
