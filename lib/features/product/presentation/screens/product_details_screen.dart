import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/product/presentation/manager/product_state.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_state.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product _product;
  const ProductDetailsScreen({super.key, required this._product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedSizeIndex = 2;
  int _selectedColorIndex = 1;

  final List<String> _sizes = const ['38', '39', '40', '41', '42'];
  final List<Color> _colors = const [
    Color(0xFF3B3B3B),
    Color(0xFFDB3022),
    Color(0xFF1E88E5),
    Color(0xFF1CB142),
    Color(0xFFFE6B60),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ProductCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: customHeader(
          leading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: Sizes.s24.r,
                color: ColorManager.text,
              ),
            ),
            IconButton(
              onPressed: () => context.push(Routes.cart),
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: Sizes.s24.r,
                color: ColorManager.text,
              ),
            ),
          ],
          title: widget._product.brand.name,
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 8.h),

                  // 🖼️ سلايدر الصور + ربط الـ Favourite بحالة الـ WishListCubit
                  BlocBuilder<WishListCubit, WishListState>(
                    builder: (context, state) {
                      final wishlistCubit = context.read<WishListCubit>();
                      final bool isFavorite = wishlistCubit.favouriteProductIds
                          .contains(widget._product.id);

                      return ProductImageSlider(
                        images: widget._product.images,
                        isFavorite: isFavorite,
                        onFavoriteTap: () {
                          if (isFavorite) {
                            wishlistCubit.deleteProductFromWishList(
                              widget._product.id,
                            );
                          } else {
                            wishlistCubit.addProductToWishList(
                              widget._product.id,
                            );
                          }
                        },
                      );
                    },
                  ),

                  SizedBox(height: Sizes.s12.h),

                  // 📝 بيانات اسم المنتج والسعر
                  ProductHeaderInfo(
                    title: widget._product.title,
                    price: widget._product.price.toString(),
                    priceAfterDiscount: widget._product.priceAfterDiscount
                        ?.toString(),
                  ),
                  SizedBox(height: 16.h),

                  // ⭐ التقييمات والكمية
                  BlocBuilder<ProductCubit, GetProductState>(
                    builder: (context, state) {
                      final productCubit = context.read<ProductCubit>();
                      return ProductRatingAndQuantity(
                        soldCount: widget._product.sold.toString(),
                        rating:
                            '${widget._product.ratingsAverage} (${widget._product.ratingsQuantity})',
                        quantity: productCubit.quantity,
                        onIncrement: () => productCubit.incrementQuantity(),
                        onDecrement: () => productCubit.decrementQuantity(),
                      );
                    },
                  ),

                  SizedBox(height: Sizes.s16.h),
                  ProductDescription(description: widget._product.description),
                  SizedBox(height: Sizes.s16.h),

                  // 📏 اختيار المقاس
                  ProductSizeSelector(
                    sizes: _sizes,
                    selectedIndex: _selectedSizeIndex,
                    onSizeSelected: (index) =>
                        setState(() => _selectedSizeIndex = index),
                  ),
                  SizedBox(height: Sizes.s16.h),

                  // 🎨 اختيار اللون
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

        // 🛒 شريط الشراء السفلي
        bottomNavigationBar: BlocBuilder<ProductCubit, GetProductState>(
          builder: (context, state) {
            final currentQuantity = context.read<ProductCubit>().quantity;
            final num unitPrice =
                widget._product.priceAfterDiscount ?? widget._product.price;
            final num totalAmount = unitPrice * currentQuantity;

            return BottomBar(
              totalPrice: "EGP $totalAmount",
              title: 'Add to cart',
              iconLeading: Icons.add_shopping_cart_rounded,
              onClicked: () async {
                EasyLoading.show(
                  status: 'Adding to cart...',
                  dismissOnTap: false,
                );
                try {
                  final cartCubit = context.read<CartCubit>();
                  await cartCubit.addToCart(widget._product.id);
                  await cartCubit.updateCart(
                    widget._product.id,
                    currentQuantity,
                  );

                  if (context.mounted) {
                    EasyLoading.dismiss();
                    context.push(Routes.cart);
                  }
                } catch (e) {
                  if (context.mounted) {
                    EasyLoading.dismiss();
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
