import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/animation_to_add_cart.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatefulWidget {
  final Product _product;

  const ProductCard({super.key, required this._product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishListCubit>();
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withAlpha(100),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(Sizes.s14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة + زر القلب
          Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.productsDetails,
                  arguments: widget._product,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Sizes.s14.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget._product.imageCover,
                    height: 140.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorListener: (value) => Center(
                      child: SizedBox(
                        height: 140.h,
                        child: const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 5.r,
                top: 5.r,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.s40.r),
                    color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.black.withAlpha(200),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (!wishlistCubit.items.contains(
                          WishlistItem(
                            images: widget._product.images,
                            id: widget._product.id,
                            title: widget._product.title,
                            price: widget._product.price,
                            imageCover: widget._product.imageCover,
                          ),
                        )) {
                          isFavourite = true;
                          wishlistCubit.addProductToWishList(
                            widget._product.id,
                          );
                        } else {
                          isFavourite = false;
                        }
                        setState(() {});
                      },
                      child: Icon(
                        isFavourite
                            ? Icons.favorite_outlined
                            : Icons.favorite_border,
                        color: ColorManager.primary,
                        size: Sizes.s24.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // تفاصيل المنتج
          Padding(
            padding: EdgeInsets.all(Insets.s8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget._product.title,
                  style: getSemiBoldStyle(color: ColorManager.primary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  widget._product.description,
                  style: getSemiBoldStyle(color: ColorManager.primary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Visibility(
                      visible: widget._product.priceAfterDiscount != null,
                      child: Text(
                        "EGP ${widget._product.priceAfterDiscount.toString()}",
                        style: getRegularStyle(
                          color: ColorManager.primary,
                          fontsize: FontSize.s14,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "EGP ${widget._product.price.toString()}",
                      style: widget._product.priceAfterDiscount == null
                          ? getRegularStyle(
                              color: ColorManager.primary,
                              fontsize: FontSize.s14,
                            )
                          : getTextWithLine(),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      "Review",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontsize: FontSize.s14,
                      ),
                    ),
                    Text(
                      "(${widget._product.ratingsAverage})",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontsize: FontSize.s14,
                      ),
                    ),
                    SizedBox(width: Sizes.s14.w),
                    Icon(Icons.star, color: ColorManager.starRate),
                    Spacer(),
                    AnimatedAddToCartButton(productId: widget._product.id),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
