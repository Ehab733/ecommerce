import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHeaderInfo extends StatelessWidget {
  final String title;
  final double price;
  final double? priceAfterDiscount;

  const ProductHeaderInfo({
    super.key,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        priceAfterDiscount != null &&
        priceAfterDiscount! > 0 &&
        priceAfterDiscount! < price;

    // حساب نسبة الخصم لمظهر فاخر ومحفز للشراء
    int discountPercent = 0;
    if (hasDiscount) {
      discountPercent = (((price - priceAfterDiscount!) / price) * 100).round();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1️⃣ اسم المنتج بوزن خطي أنيق وواضح
        Text(
          title,
          style: getBoldStyle(
            color: ColorManager.textPrimary,
            fontsize: FontSize.s18.sp,
          ).copyWith(height: 1.3),
        ),
        SizedBox(height: Insets.s10.h),

        // 2️⃣ قسم الأسعار وتخفيضات العرض
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasDiscount) ...[
              // السعر بعد الخصم
              Text(
                "EGP ${priceAfterDiscount!.toStringAsFixed(2)}",
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s20.sp,
                ),
              ),
              SizedBox(width: Insets.s10.w),

              // السعر القديم المشطوب
              Text(
                "EGP ${price.toStringAsFixed(2)}",
                style: getTextWithLine(
                  color: ColorManager.grey,
                ).copyWith(fontSize: FontSize.s13.sp, height: 1.2),
              ),
              const Spacer(),

              // شارة نسبة الخصم الفاخرة
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s8.w,
                  vertical: Insets.s4.h,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(Sizes.s8.r),
                  border: Border.all(
                    color: ColorManager.primary.withValues(alpha: 0.2),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  "$discountPercent% OFF",
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontsize: FontSize.s11.sp,
                  ),
                ),
              ),
            ] else ...[
              // السعر العادي في حال عدم وجود خصم
              Text(
                "EGP ${price.toStringAsFixed(2)}",
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s20.sp,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
