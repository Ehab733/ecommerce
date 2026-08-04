import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/mappers/wishlist_item_mapper.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_item_model.dart';
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

      // ✅ التحويل الصريح والأمن لـ List<String>
      final List<String> wishlistIds = response.data != null
          ? List<String>.from(response.data as List)
          : [];

      return Right(wishlistIds);
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(ErrorHandler.handle(error.message));
    } catch (error) {
      Logger().d(error);
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, List<WishlistItem>>> getWishList() async {
    try {
      final response = await _remoteDataSource.getWishList();
      Logger().i(response.data);

      final rawList = response.data;

      final items =
          rawList
              ?.map(
                (e) => WishlistItemModel.fromJson(
                  e as Map<String, dynamic>,
                ).toEntity,
              )
              .toList() ??
          [];

      return Right(items);
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(ErrorHandler.handle(error.message));
    } catch (error) {
      Logger().d(error);
      return Left(ErrorHandler.handle(error));
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

      // ✅ تحويل أمن للـ List<String> عند الحذف
      final List<String> wishlistIds = response.data != null
          ? List<String>.from(response.data as List)
          : [];

      return Right(wishlistIds);
    } on RemoteException catch (error) {
      Logger().d(error.message);
      return Left(ErrorHandler.handle(error.message));
    } catch (error) {
      Logger().d(error);
      return Left(ErrorHandler.handle(error));
    }
  }
}
