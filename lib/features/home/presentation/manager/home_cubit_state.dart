import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit_state.freezed.dart';

@freezed
class HomeCubitState with _$HomeCubitState {
  const factory HomeCubitState.homeCubitInitial() = _initial;

  const factory HomeCubitState.getCategoriesLoading() = _getCategoriesLoading;
  const factory HomeCubitState.getCategoriesFailure({required String message}) =
      _getCategoriesFailure;
  const factory HomeCubitState.getCategoriesSuccess({
    required List<Category> categories,
  }) = _getCategoriesSuccess;
}
