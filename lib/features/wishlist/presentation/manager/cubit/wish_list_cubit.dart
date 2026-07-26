import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/add_product_to_wish_list_use_case.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/delete_product_from_wishlist_usecase.dart';
import 'package:ecommerce/features/wishlist/domain/usecases/get_user_wishlist_usecase.dart';
import 'package:injectable/injectable.dart';

part 'wish_list_state.dart';

@singleton
class WishListCubit extends Cubit<WishListState> {
  final GetUserWishlistUsecase _getUserWishlistUsecase;
  final AddProductToWishListUseCase _addProductToWishListUseCase;
  final DeleteProductFromWishlistUsecase _deleteProductFromWishlistUsecase;

  late List<WishlistItem> items;
  WishListCubit(
    this._getUserWishlistUsecase,
    this._addProductToWishListUseCase,
    this._deleteProductFromWishlistUsecase,
  ) : super(WishListInitial());

  Future<void> getWishList() async {
    emit(GetWishListLoading());
    final response = await _getUserWishlistUsecase();
    response.fold((failure) => emit(GetWishListError(failure.message)), (
      wishListItem,
    ) {
      items = wishListItem;
      emit(GetWishListSuccess());
    });
  }

  Future<void> addProductToWishList(String productId) async {
    emit(AddProductToWishListLoading());

    final response = await _addProductToWishListUseCase(productId);

    response.fold(
      (failure) => emit(AddProductToWishListError(failure.message)),
      (_) => emit(AddProductToWishListSuccess()),
    );
  }

  Future<void> deleteProductFromWishList(String productId) async {
    emit(DeleteProductFromWishListLoading());
    final response = await _deleteProductFromWishlistUsecase(productId);

    response.fold(
      (failure) => emit(DeleteProductFromWishListError(failure.message)),
      (_) {
        emit(DeleteProductFromWishListSuccess());
      },
    );
  }
}
