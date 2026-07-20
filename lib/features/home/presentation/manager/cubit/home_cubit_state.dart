part of 'home_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class GetCategoriesLoading extends HomeCubitState {}

final class GetCategoriesFailure extends HomeCubitState {
  final String message;

  GetCategoriesFailure(this.message);
}

final class GetCategoriesSuccess extends HomeCubitState {
  final List<Category> categories;

  GetCategoriesSuccess(this.categories);
}
