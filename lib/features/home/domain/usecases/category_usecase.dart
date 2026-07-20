import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryUsecase {
  final HomeRepository _homeRepository;

  const CategoryUsecase(this._homeRepository);

  Future<Either<Failure, List<Category>>> call() =>
      _homeRepository.getCategories();
}
