import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/delete_from_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUsecase _addToCartUsecase;
  final GetCartUsecase _getCartUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final DeleteFromCartUsecase _deleteFromCartUsecase;
  Cart cart = Cart(products: [], totalCartPrice: 0.0);

  CartCubit(
    this._addToCartUsecase,
    this._getCartUsecase,
    this._updateCartUsecase,
    this._deleteFromCartUsecase,
  ) : super(const CartState.initial());

  Future<void> addToCart(String productId) async {
    emit(CartState.addToCartLoading(productId: productId));
    final result = await _addToCartUsecase(productId);
    result.fold(
      (failure) => emit(
        CartState.addToCartError(
          errorMessage: failure.message,
          productId: productId,
        ),
      ),
      (_) => emit(CartState.addToCartSuccess(productId: productId)),
    );
  }

  Future<void> getCart() async {
    emit(const CartState.getCartLoading());
    final result = await _getCartUsecase();
    result.fold(
      (failure) => emit(CartState.getCartError(errorMessage: failure.message)),
      (userCart) {
        cart = userCart;
        emit(const CartState.getCartSuccess());
      },
    );
  }

  Future<void> updateCart(String productId, int quantity) async {
    emit(const CartState.updateCartLoading());
    final result = await _updateCartUsecase(productId, quantity);
    result.fold(
      (failure) =>
          emit(CartState.updateCartError(errorMessage: failure.message)),
      (userCart) {
        cart = userCart;
        emit(const CartState.updateCartSuccess());
      },
    );
  }

  Future<void> deleteFromCart(String productId) async {
    emit(const CartState.deleteFromCartLoading());
    final result = await _deleteFromCartUsecase(productId);
    result.fold(
      (failure) =>
          emit(CartState.deleteFromCartError(errorMessage: failure.message)),
      (userCart) {
        cart = userCart;
        emit(const CartState.deleteFromCartSuccess());
      },
    );
  }
}
