import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/bottom_bar.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/presentation/manager/product_cubit.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_color_selector.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_header_info.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_image_slider.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_rating_and_quantity.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_size_selector.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  int _selectedSizeIndex = 2;
  int _selectedColorIndex = 1;
  bool _isFavorite = false;

  final List<String> _sizes = const ['38', '39', '40', '41', '42'];
  final List<Color> _colors = const [
    Color(0xFF3B3B3B),
    Color(0xFFDB3022),
    Color(0xFF1E88E5),
    Color(0xFF1CB142),
    Color(0xFFFE6B60),
  ];
  final _productCubit = getIt.get<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.settingsOf(context)!.arguments as Product;
    return BlocProvider(
      create: (_) => _productCubit,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: customHeader(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: Sizes.s24.r,
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.cart);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: Sizes.s24.r,
                color: ColorManager.primary,
              ),
            ),
          ],
          title: product.brand.name,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ProductImageSlider(
                    images: product.images,
                    isFavorite: _isFavorite,
                    onFavoriteTap: () {
                      final wishlistCubit = context.read<WishListCubit>();

                      if (product.id != null) {
                        wishlistCubit.addProductToWishList(product.id!);

                        // 🎯 التعديل هنا: عكس القيمة وإسنادها مجدداً
                        _isFavorite = !_isFavorite;

                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: Sizes.s8.h),
                  ProductHeaderInfo(
                    title: product.title,
                    price: product.price.toString(),
                    priceAfterDiscount: product.priceAfterDiscount.toString(),
                  ),
                  SizedBox(height: 16.h),

                  BlocBuilder<ProductCubit, GetProductState>(
                    builder: (context, state) {
                      return ProductRatingAndQuantity(
                        soldCount: product.sold.toString(),
                        rating:
                            '${product.ratingsAverage} (${product.ratingsQuantity})',
                        quantity: _quantity,
                        onIncrement: () {
                          _quantity++;
                          _productCubit.onQuantityChanged();
                        },
                        onDecrement: () {
                          if (_quantity > 1) {
                            _quantity--;
                            _productCubit.onQuantityChanged();
                          }
                        },
                      );
                    },
                  ),

                  SizedBox(height: Sizes.s16.h),
                  ProductDescription(description: product.description),
                  SizedBox(height: Sizes.s16.h),
                  ProductSizeSelector(
                    sizes: _sizes,
                    selectedIndex: _selectedSizeIndex,
                    onSizeSelected: (index) =>
                        setState(() => _selectedSizeIndex = index),
                  ),
                  SizedBox(height: Sizes.s16.h),
                  ProductColorSelector(
                    colors: _colors,
                    selectedIndex: _selectedColorIndex,
                    onColorSelected: (index) =>
                        setState(() => _selectedColorIndex = index),
                  ),
                  SizedBox(height: Sizes.s24.h),
                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<ProductCubit, GetProductState>(
          builder: (context, state) {
            return BottomBar(
              totalPrice: "EGP ${(product.price * _quantity).toString()}",
              onClicked: () async {
                UiUtils.showLoading(context);
                try {
                  final cartCubit = context.read<CartCubit>();
                  await cartCubit.addToCart(product.id);
                  await cartCubit.updateCart(product.id, _quantity);

                  if (context.mounted) {
                    UiUtils.hideLoading(context);
                    Navigator.pushNamed(context, Routes.cart);
                  }
                } catch (e) {
                  if (context.mounted) {
                    UiUtils.hideLoading(context);
                  }
                }
              },
              title: 'Add to cart',
              iconLeading: Icons.add_shopping_cart,
            );
          },
        ),
      ),
    );
  }
}
