import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
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
    const darkBlueColor = Color(0xFF003F6F);
    const primaryTextColor = Color(0xFF1E2843);
    const subtitleTextColor = Color(0xFF6C6F81);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: darkBlueColor.withOpacity(0.18), width: 1.r),
      ),
      child: Row(
        children: [
          // 📷 صورة المنتج داخل كبسولة رمادية
          Container(
            height: 100.h,
            width: 110.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: CachedNetworkImage(
                  imageUrl: cartItemData.product.imageCover,
                  fit: BoxFit.cover,
                  errorListener: (value) =>
                      const Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 📝 تفاصيل المنتج والتحكم
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان + زر الحذف
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cartItemData.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: primaryTextColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onDelete,
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: darkBlueColor,
                            size: 22.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // دائرة اللون + الحجم
                  Row(
                    children: [
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          color: ColorManager.darkPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Yellow | Size: 40',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: subtitleTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // السعر + عداد الكمية
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (cartItemData.count * cartItemData.price).toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: darkBlueColor,
                        ),
                      ),

                      // Quantity Stepper Capsule
                      Container(
                        height: 34.h,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: darkBlueColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: onDecrement,
                              child: Padding(
                                padding: EdgeInsets.all(4.r),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16.r,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                cartItemData.count.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: onIncrement,
                              child: Padding(
                                padding: EdgeInsets.all(4.r),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16.r,
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
