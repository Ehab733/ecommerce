import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/product/domain/usecases/product_usecase.dart';
import 'package:ecommerce/features/product/presentation/manager/product_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<GetProductState> {
  final ProductUsecase _productUsecase;
  int quantity = 1;

  ProductCubit(this._productUsecase) : super(GetProductState.initial());

  Future<void> getProducts(String? categoryId, {int page = 1}) async {
    emit(GetProductState.loading());
    final response = await _productUsecase(categoryId);

    response.fold(
      (failure) => emit(GetProductState.error(message: failure.message)),
      (products) => emit(GetProductState.success(products: products)),
    );
  }

  void incrementQuantity() {
    quantity++;
    emit(GetProductState.quantityChanged(quantity: quantity));
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(GetProductState.quantityChanged(quantity: quantity));
    }
  }
}
