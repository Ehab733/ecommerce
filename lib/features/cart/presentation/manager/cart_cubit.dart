import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/delete_from_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUsecase _addToCartUsecase;
  final GetCartUsecase _getCartUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final DeleteFromCartUsecase _deleteFromCartUsecase;
  late Cart cart;

  CartCubit(
    this._addToCartUsecase,
    this._getCartUsecase,
    this._updateCartUsecase,
    this._deleteFromCartUsecase,
  ) : super(CartInitial());

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading(productId));
    final result = await _addToCartUsecase(productId);
    result.fold(
      (failure) => emit(AddToCartError(failure.message,productId)),
      (_) => emit(AddToCartSuccess(productId)),
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCartUsecase();
    result.fold((failure) => emit(GetCartError(failure.message)), (userCart) {
      cart = userCart;
      emit(GetCartSuccess());
    });
  }

  Future<void> updateCart(String productId, int quantity) async {
    emit(UpdateCartLoading());
    final result = await _updateCartUsecase(productId, quantity);
    result.fold((failure) => emit(UpdateCartError(failure.message)), (
      userCart,
    ) {
      cart = userCart;
      emit(UpdateCartSuccess());
    });
  }

  Future<void> deleteFromCart(String productId) async {
    emit(DeleteFromCartLoading());
    final result = await _deleteFromCartUsecase(productId);
    result.fold((failure) => emit(DeleteFromCartError(failure.message)), (
      userCart,
    ) {
      cart = userCart;
      emit(DeleteFromCartSuccess());
    });
  }
}
