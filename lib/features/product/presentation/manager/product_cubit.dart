import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/usecases/product_usecase.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<GetProductState> {
  final ProductUsecase _productUsecase;

  ProductCubit(this._productUsecase) : super(GetProductInitial());

  Future<void> getProducts(String? categoryId) async {
    emit(GetProductLoading());
    final response = await _productUsecase(categoryId);

    response.fold(
      (failure) => emit(GetProductError(failure.message)),
      (products) => emit(GetProductSuccess(products)),
    );
  }

  void onQuantityChanged() => emit(QuantityChanged());
}
