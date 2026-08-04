import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/usecases/category_usecase.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeCubitState> {
  final CategoryUsecase _categoryUsecase;
  HomeCubit(this._categoryUsecase)
    : super(const HomeCubitState.homeCubitInitial());

  Future<void> getCategories() async {
    emit(const HomeCubitState.getCategoriesLoading());
    final result = await _categoryUsecase();
    result.fold(
      (failure) =>
          emit(HomeCubitState.getCategoriesFailure(message: failure.message)),
      (categories) =>
          emit(HomeCubitState.getCategoriesSuccess(categories: categories)),
    );
  }
}
