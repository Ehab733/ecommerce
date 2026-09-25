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
        border: Border.all(
          color: ColorManager.lightGrey.withValues(alpha: 0.3),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🖼️ صورة المنتج بلمسة ناعمة
          Padding(
            padding: EdgeInsets.all(Insets.s8.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.s12.r),
              child: Container(
                height: 96.h,
                width: 90.w,
                color: ColorManager.lightGrey.withValues(alpha: 0.12),
                child: CachedNetworkImage(
                  imageUrl: cartItemData.product.imageCover,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: SizedBox.square(
                      dimension: Sizes.s18.r,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.broken_image_rounded,
                    color: ColorManager.lightGrey,
                    size: Sizes.s24.sp,
                  ),
                ),
              ),
            ),
          ),

          // 📝 تفاصيل المنتج وسعر العناصر والعداد
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: Insets.s10.h,
                bottom: Insets.s10.h,
                right: Insets.s12.w,
                left: Insets.s4.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 📌 اسم المنتج + زر الحذف
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          cartItemData.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textPrimary,
                            fontsize: FontSize.s14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: Sizes.s8.w),
                      InkWell(
                        onTap: onDelete,
                        borderRadius: BorderRadius.circular(Sizes.s12.r),
                        child: Padding(
                          padding: EdgeInsets.all(Insets.s2.r),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: ColorManager.error.withValues(alpha: 0.85),
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Sizes.s4.h),

                  // 🎨 الخصائص الفرعية (اللون / المقاس)
                  Row(
                    children: [
                      Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: const BoxDecoration(
                          color: ColorManager.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: Sizes.s8.w),
                      Text(
                        'Size: 40',
                        style: getRegularStyle(
                          color: ColorManager.textSecondary,
                          fontsize: FontSize.s11.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Sizes.s12.h),

                  // 💰 السعر الإجمالي + كبسولة العداد (Stepper)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${(cartItemData.count * cartItemData.price)}",
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: FontSize.s15.sp,
                        ),
                      ),

                      // 🔢 كبسولة التحكم بالكمية الزجاجية/الفاخرة
                      Container(
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: Insets.s4.w),
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(Sizes.s20.r),
                          border: Border.all(
                            color: ColorManager.primary.withValues(alpha: 0.15),
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: onDecrement,
                              borderRadius: BorderRadius.circular(Sizes.s12.r),
                              child: Container(
                                padding: EdgeInsets.all(Insets.s4.r),
                                decoration: const BoxDecoration(
                                  color: ColorManager.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.remove_rounded,
                                  color: ColorManager.primary,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s10.w,
                              ),
                              child: Text(
                                cartItemData.count.toString(),
                                style: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontsize: FontSize.s13.sp,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: onIncrement,
                              borderRadius: BorderRadius.circular(Sizes.s12.r),
                              child: Container(
                                padding: EdgeInsets.all(Insets.s4.r),
                                decoration: const BoxDecoration(
                                  color: ColorManager.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add_rounded,
                                  color: ColorManager.white,
                                  size: 14.sp,
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
}
