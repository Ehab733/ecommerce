import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/mappers/wishlist_item_mapper.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource _remoteDataSource;

  const WishlistRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<String>>> addProductToWishList(
    String productId,
  ) async {
    try {
      final response = await _remoteDataSource.addProductToWishList(productId);
      return Right(response.items ?? []);
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<WishlistItem>>> getWishList() async {
    try {
      final response = await _remoteDataSource.getWishList();
      return Right(
        response.wishlistItem?.map((e) => e.toEntity).toList() ?? [],
      );
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> removeProductToWishList(
    String productId,
  ) async {
    try {
      final response = await _remoteDataSource.removeProductToWishList(
        productId,
      );
      return Right(response.items ?? []);
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }
}
