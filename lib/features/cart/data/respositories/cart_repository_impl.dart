import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_source/remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_mapper.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/respositories/cart_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  const CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, void>> addProductToCart(String productId) async {
    try {
      await _cartRemoteDataSource.addProductToCart(productId);
      return const Right(null);
    } on RemoteException catch (error) {
      return Left(ErrorHandler.handle(error.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await _cartRemoteDataSource.getCart();
      Logger().i(response.data.toEntity);
      return Right(response.data.toEntity);
    } catch (error) {
      Logger().e(error);
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(
    String productId,
    int quantity,
  ) async {
    try {
      final response = await _cartRemoteDataSource.updateCart(
        productId,
        quantity,
      );
      return Right(response.data.toEntity);
    } catch (error) {
      Logger().e(error);
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteFormCart(String productId) async {
    try {
      final response = await _cartRemoteDataSource.deleteFormCart(productId);
      return Right(response.data.toEntity);
    } catch (error) {
      Logger().e(error);
      return Left(ErrorHandler.handle(error));
    }
  }
}
