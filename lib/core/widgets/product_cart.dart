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
import 'package:logger/logger.dart';

class ProductCard extends StatelessWidget {
  final Product _product;

  const ProductCard({super.key, required this._product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        final wishlistCubit = context.read<WishListCubit>();
        bool isFavourite = wishlistCubit.favouriteProductIds.contains(
          _product.id,
        );
        return Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withAlpha(20),
                blurRadius: 10.r,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // 👈 يلغي التمدد الرأسي
            children: [
              // 🖼️ 1. صورة المنتج
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: _product.imageCover,
                      height: 125.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 125.h,
                        color: ColorManager.grey,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 125.h,
                        color: Colors.grey.shade100,
                        child: Icon(
                          Icons.broken_image_rounded,
                          color: ColorManager.lightGrey,
                          size: Sizes.s28.sp,
                        ),
                      ),
                    ),
                  ),

                  // ❤️ زر المفضلة
                  Positioned(
                    right: 6.w,
                    top: 6.h,
                    child: InkWell(
                      onTap: () {
                        if (isFavourite) {
                          wishlistCubit.deleteProductFromWishList(_product.id);
                        } else {
                          wishlistCubit.addProductToWishList(_product.id);
                        }
                        // تحديث حالة المفضلة بعد
                      },
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.black.withAlpha(25),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavourite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavourite
                              ? const Color(0xFFEB3003)
                              : const Color(0xFFA8A8A8),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 📝 2. تفاصيل المنتج والتقييم والسعر
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // 👈 يلم العناصر جنب بعضها
                  children: [
                    Text(
                      _product.title,
                      style: getBoldStyle(color: ColorManager.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _product.description,
                      style: getRegularStyle(
                        color: ColorManager.grey,
                        fontsize: FontSize.s10,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Visibility(
                          visible:
                              _product.priceAfterDiscount != null &&
                              _product.priceAfterDiscount != 0.0,
                          child: Text(
                            "EGP ${_product.priceAfterDiscount}",
                            style: getBoldStyle(color: ColorManager.primary),
                          ),
                        ),
                        Text(
                          "EGP ${_product.price}",
                          style:
                              _product.priceAfterDiscount != null &&
                                  _product.priceAfterDiscount != 0.0
                              ? getTextWithLine()
                              : getBoldStyle(color: ColorManager.primary),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < (_product.ratingsAverage).round()
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: index < (_product.ratingsAverage).round()
                                  ? ColorManager.starRate
                                  : ColorManager.grey,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Text(
                            "${_product.ratingsQuantity} reviews",
                            style: getRegularStyle(
                              color: ColorManager.grey,
                              fontsize: FontSize.s11,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AnimatedAddToCartButton(productId: _product.id),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
