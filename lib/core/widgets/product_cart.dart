import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/helpers/animations/animation_to_add_cart.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.priceAfterDiscount != null &&
        product.priceAfterDiscount! > 0 &&
        product.priceAfterDiscount != product.price;

    int discountPercent = 0;
    if (hasDiscount && product.price > 0) {
      discountPercent =
          (((product.price - product.priceAfterDiscount!) / product.price) *
                  100)
              .round();
    }

    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.08),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withValues(alpha: 0.04),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1️⃣ إطار الصورة التفاعلي + الأيقونات المضيئة
          Stack(
            children: [
              Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.primary.withValues(alpha: 0.03),
                      ColorManager.primary.withValues(alpha: 0.08),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Sizes.s20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(Insets.s8.r),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Sizes.s16.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.imageCover,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          width: 20.r,
                          height: 20.r,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.broken_image_rounded,
                        color: ColorManager.grey,
                        size: Sizes.s28.sp,
                      ),
                    ),
                  ),
                ),
              ),

              // 🏷️ شارة الخصم العصري المتدرجة
              if (hasDiscount && discountPercent > 0)
                Positioned(
                  left: Insets.s10.w,
                  top: Insets.s10.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.s8.w,
                      vertical: Insets.s4.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF5252), Color(0xFFFF1744)],
                      ),
                      borderRadius: BorderRadius.circular(Sizes.s12.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF1744).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      '-$discountPercent%',
                      style: getBoldStyle(
                        color: ColorManager.white,
                        fontsize: FontSize.s10.sp,
                      ),
                    ),
                  ),
                ),

              // ❤️ زر المفضلة الدائري
              Positioned(
                right: Insets.s10.w,
                top: Insets.s10.h,
                child: BlocBuilder<WishListCubit, WishListState>(
                  builder: (context, state) {
                    final wishlistCubit = context.read<WishListCubit>();
                    final isFavourite = wishlistCubit.favouriteProductIds
                        .contains(product.id);

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (isFavourite) {
                            wishlistCubit.deleteProductFromWishList(product.id);
                          } else {
                            wishlistCubit.addProductToWishList(product.id);
                          }
                        },
                        borderRadius: BorderRadius.circular(Sizes.s50.r),
                        child: Container(
                          padding: EdgeInsets.all(Insets.s8.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.black.withValues(
                                  alpha: 0.1,
                                ),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(scale: animation, child: child),
                            child: Icon(
                              isFavourite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              key: ValueKey<bool>(isFavourite),
                              color: isFavourite
                                  ? const Color(0xFFFF2D55)
                                  : ColorManager.grey,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // 2️⃣ النصوص والتفاصيل والأسعار
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Insets.s12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // كبسولة التقييم
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.s6.w,
                          vertical: Insets.s2.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.starRate.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(Sizes.s8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: ColorManager.starRate,
                              size: 13.sp,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              product.ratingsAverage.toStringAsFixed(1),
                              style: getBoldStyle(
                                color: ColorManager.textPrimary,
                                fontsize: FontSize.s10.sp,
                              ),
                            ),
                            Text(
                              " (${product.ratingsQuantity})",
                              style: getRegularStyle(
                                color: ColorManager.grey,
                                fontsize: FontSize.s10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Sizes.s8.h),

                      Text(
                        product.title,
                        style: getBoldStyle(
                          color: ColorManager.textPrimary,
                          fontsize: FontSize.s13.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: Sizes.s2.h),
                      Text(
                        product.description,
                        style: getRegularStyle(
                          color: ColorManager.grey,
                          fontsize: FontSize.s10.sp,
                        ).copyWith(height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),

                  // الأسعار وزر الإضافة للسلة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (hasDiscount)
                              Text(
                                "EGP ${product.price}",
                                style: getTextWithLine().copyWith(
                                  fontSize: FontSize.s10.sp,
                                  color: ColorManager.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            Text(
                              "EGP ${hasDiscount ? product.priceAfterDiscount : product.price}",
                              style: getBoldStyle(
                                color: ColorManager.primary,
                                fontsize: FontSize.s14.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Sizes.s4.w),
                      AnimatedAddToCartButton(productId: product.id),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
