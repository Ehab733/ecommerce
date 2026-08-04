import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/add_product_to_wish_list_use_case.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/delete_product_from_wishlist_usecase.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/get_user_wishlist_usecase.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class WishListCubit extends Cubit<WishListState> {
  final GetUserWishlistUsecase _getUserWishlistUsecase;
  final AddProductToWishListUseCase _addProductToWishListUseCase;
  final DeleteProductFromWishlistUsecase _deleteProductFromWishlistUsecase;
  final Set<String> favouriteProductIds = {};
  List<WishlistItem> items = [];
  WishListCubit(
    this._getUserWishlistUsecase,
    this._addProductToWishListUseCase,
    this._deleteProductFromWishlistUsecase,
  ) : super(WishListState.initial());

  bool isFavourite(String productId) {
    return favouriteProductIds.contains(productId);
  }

  Future<void> getWishList() async {
    emit(WishListState.getWishListLoading());
    final response = await _getUserWishlistUsecase();
    response.fold(
      (failure) =>
          emit(WishListState.getWishListError(message: failure.message)),
      (wishListItem) {
        items = wishListItem;

        favouriteProductIds.clear();
        for (var item in items) {
          favouriteProductIds.add(item.id);
        }
        emit(WishListState.getWishListSuccess());
      },
    );
  }

  Future<void> addProductToWishList(String productId) async {
    emit(WishListState.addProductToWishListLoading());

    final response = await _addProductToWishListUseCase(productId);

    response.fold(
      (failure) => emit(
        WishListState.addProductToWishListError(message: failure.message),
      ),
      (_) {
        favouriteProductIds.add(productId);
        emit(WishListState.addProductToWishListSuccess());
        getWishList();
      },
    );
  }

  Future<void> deleteProductFromWishList(String productId) async {
    emit(WishListState.deleteProductFromWishListLoading());
    final response = await _deleteProductFromWishlistUsecase(productId);

    response.fold(
      (failure) => emit(
        WishListState.deleteProductFromWishListError(message: failure.message),
      ),
      (_) {
        favouriteProductIds.remove(productId);
        items.removeWhere((item) => item.id == productId);
        emit(WishListState.deleteProductFromWishListSuccess());
        getWishList();
      },
    );
  }
}
