import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/bottom_bar.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/presentation/manager/product_cubit.dart';
import 'package:ecommerce/features/product/presentation/manager/product_state.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_color_selector.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_header_info.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_image_slider.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_rating_and_quantity.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_size_selector.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product _product;
  const ProductDetailsScreen({super.key, required product})
    : _product = product;

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
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(
              0xFFFAF9FF,
            ), // خلفية ناعمة وفاخرة متناسقة
            appBar: customHeader(
              leading: false,
              actions: [
                // 🔍 زر البحث العلوي
                _buildActionIconButton(
                  icon: Icons.search_rounded,
                  onPressed: () {},
                ),
                SizedBox(width: Insets.s8.w),
                // 🛒 زر السلة العلوي
                _buildActionIconButton(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: () => context.push(Routes.cart),
                ),
                SizedBox(width: Insets.s12.w),
              ],
              title: widget._product.brand.name,
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Insets.s20.w,
                    vertical: Insets.s12.h,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // 🖼️ سلايدر الصور الفاخر مع حالة المفضلة
                      BlocBuilder<WishListCubit, WishListState>(
                        builder: (context, state) {
                          final wishlistCubit = context.read<WishListCubit>();
                          final bool isFavorite = wishlistCubit
                              .favouriteProductIds
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

                      SizedBox(height: Insets.s20.h),

                      // 📝 بيانات اسم المنتج والأسعار
                      ProductHeaderInfo(
                        title: widget._product.title,
                        price: widget._product.price,
                        priceAfterDiscount:
                            widget._product.priceAfterDiscount ?? 0.0,
                      ),
                      SizedBox(height: Insets.s16.h),

                      // ⭐ التقييمات وعدد القطع المباعة مع أداة تعديل الكمية
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

                      SizedBox(height: Insets.s20.h),

                      // 📄 وصف المنتج
                      ProductDescription(
                        description: widget._product.description,
                      ),
                      SizedBox(height: Insets.s20.h),

                      // 📏 اختيار المقاسات
                      ProductSizeSelector(
                        sizes: _sizes,
                        selectedIndex: _selectedSizeIndex,
                        onSizeSelected: (index) =>
                            setState(() => _selectedSizeIndex = index),
                      ),
                      SizedBox(height: Insets.s20.h),

                      // 🎨 اختيار الألوان
                      ProductColorSelector(
                        colors: _colors,
                        selectedIndex: _selectedColorIndex,
                        onColorSelected: (index) =>
                            setState(() => _selectedColorIndex = index),
                      ),
                      SizedBox(height: Insets.s32.h),
                    ]),
                  ),
                ),
              ],
            ),

            // 🛒 شريط الشراء السفلي الفاخر
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: BlocBuilder<ProductCubit, GetProductState>(
                  builder: (context, state) {
                    final currentQuantity = context
                        .read<ProductCubit>()
                        .quantity;
                    final num unitPrice =
                        widget._product.priceAfterDiscount ??
                        widget._product.price;
                    final num totalAmount = unitPrice * currentQuantity;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.s20.w,
                        vertical: Insets.s12.h,
                      ),
                      child: BottomBar(
                        totalPrice: "EGP ${totalAmount.toStringAsFixed(2)}",
                        title: 'Add to cart',
                        iconLeading: Icons.add_shopping_cart_rounded,
                        onClicked: () async {
                          EasyLoading.show(
                            status: 'Adding to cart...',
                            dismissOnTap: false,
                            maskType: EasyLoadingMaskType.black,
                            options: EasyLoadingOptions(
                              userInteractions: false,
                            ),
                          );
                          try {
                            final cartCubit = context.read<CartCubit>();
                            await cartCubit.addToCart(widget._product.id);
                            await cartCubit.updateCart(
                              widget._product.id,
                              currentQuantity,
                            );

                            if (context.mounted) {
                              context.push(Routes.cart);
                            }
                          } finally {
                            if (context.mounted) {
                              EasyLoading.dismiss();
                            }
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🛠️ زر أيقونة علوي بتصميم دائري فاخر متوافق مع الهوية
  Widget _buildActionIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(Sizes.s16.r),
        child: Container(
          padding: EdgeInsets.all(Insets.s8.r),
          decoration: BoxDecoration(
            color: ColorManager.primary.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(Sizes.s16.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.12),
              width: 1.w,
            ),
          ),
          child: Icon(icon, size: Sizes.s20.sp, color: ColorManager.primary),
        ),
      ),
    );
  }
}
