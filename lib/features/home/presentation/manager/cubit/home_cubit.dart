import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/usecases/category_usecase.dart';
import 'package:injectable/injectable.dart';
part 'home_cubit_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeCubitState> {
  final CategoryUsecase _categoryUsecase;
  HomeCubit(this._categoryUsecase) : super(HomeCubitInitial()) {
    getCategories();
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _categoryUsecase();
    result.fold(
      (failure) => emit(GetCategoriesFailure(failure.message)),
      (categories) => emit(GetCategoriesSuccess(categories)),
    );
  }
}
