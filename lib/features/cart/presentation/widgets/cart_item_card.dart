import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  final CartItemData cartItemData;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.cartItemData,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(Sizes.s16.r),
        border: Border.all(color: ColorManager.grey2, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🖼️ صورة المنتج داخل حاوية رمادية ناعمة
          Container(
            height: 110.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizes.s16.r),
                bottomLeft: Radius.circular(Sizes.s16.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizes.s16.r),
                bottomLeft: Radius.circular(Sizes.s16.r),
              ),
              child: CachedNetworkImage(
                imageUrl: cartItemData.product.imageCover,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: Sizes.s20.w,
                    height: Sizes.s20.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.broken_image_rounded,
                  color: ColorManager.lightGrey,
                  size: Sizes.s28.sp,
                ),
              ),
            ),
          ),

          // 📝 تفاصيل المنتج وزر العداد
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s12.w,
                vertical: Insets.s10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 📌 العنوان + زر الحذف
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cartItemData.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.text,
                            fontsize: FontSize.s15,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onDelete,
                        borderRadius: BorderRadius.circular(Sizes.s20.r),
                        child: Padding(
                          padding: EdgeInsets.all(Insets.s4.r),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: ColorManager.error,
                            size: Sizes.s20.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.s4.h),

                  // 🎨 اختيار اللون والمقاس (Visual Details)
                  Row(
                    children: [
                      Container(
                        width: Sizes.s12.r,
                        height: Sizes.s12.r,
                        decoration: const BoxDecoration(
                          color: ColorManager.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: Sizes.s4.w),
                      Text(
                        'Size: 40',
                        style: getRegularStyle(
                          color: ColorManager.grey,
                          fontsize: FontSize.s12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.s12.h),

                  // 💰 السعر + كبسولة العداد (Quantity Stepper)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${(cartItemData.count * getPrice())}",
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: FontSize.s16,
                        ),
                      ),

                      // 🔢 كبسولة التحكم بالكمية
                      Container(
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: Insets.s4.w),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(Sizes.s20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: onDecrement,
                              borderRadius: BorderRadius.circular(Sizes.s12.r),
                              child: Padding(
                                padding: EdgeInsets.all(Insets.s4.r),
                                child: Icon(
                                  Icons.remove_rounded,
                                  color: ColorManager.white,
                                  size: Sizes.s16.r,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s8.w,
                              ),
                              child: Text(
                                cartItemData.count.toString(),
                                style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s14,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: onIncrement,
                              borderRadius: BorderRadius.circular(Sizes.s12.r),
                              child: Padding(
                                padding: EdgeInsets.all(Insets.s4.r),
                                child: Icon(
                                  Icons.add_rounded,
                                  color: ColorManager.white,
                                  size: Sizes.s16.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  double getPrice() {
    if (cartItemData.priceAfterDiscount == null ||
        cartItemData.priceAfterDiscount == 0) {
      return cartItemData.price;
    }
    return cartItemData.priceAfterDiscount!;
  }
}
