import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRatingAndQuantity extends StatelessWidget {
  final String soldCount;
  final String rating;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductRatingAndQuantity({
    super.key,
    required this.soldCount,
    required this.rating,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1️⃣ شارة عدد القطع المباعة (Sold Badge) بتصميم نظيف
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s12.w,
            vertical: Insets.s6.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.primary.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(Sizes.s16.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.1),
              width: 1.w,
            ),
          ),
          child: Text(
            '$soldCount Sold',
            style: getBoldStyle(
              color: ColorManager.textPrimary,
              fontsize: FontSize.s12.sp,
            ),
          ),
        ),
        SizedBox(width: Insets.s12.w),

        // 2️⃣ التقييم المضيء والفاخر
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s10.w,
            vertical: Insets.s6.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.starRate.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(Sizes.s16.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                color: ColorManager.starRate,
                size: Sizes.s16.r,
              ),
              SizedBox(width: Insets.s4.w),
              Text(
                rating,
                style: getBoldStyle(
                  color: ColorManager.textPrimary,
                  fontsize: FontSize.s12.sp,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // 3️⃣ كبسولة تعديل الكمية (Quantity Stepper) بستايل Minimal Luxury
        Container(
          height: Sizes.s32.h,
          padding: EdgeInsets.symmetric(horizontal: Insets.s6.w),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(Sizes.s20.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.15),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.primary.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStepperButton(
                icon: Icons.remove_rounded,
                onTap: onDecrement,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.s10.w),
                child: Text(
                  '$quantity',
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s14.sp,
                  ),
                ),
              ),
              _buildStepperButton(icon: Icons.add_rounded, onTap: onIncrement),
            ],
          ),
        ),
      ],
    );
  }

  // 🛠️ Helper Method لإعادة استخدام أزرار الـ + والـ - بشكل أنيق
  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Sizes.s14.r),
        child: Container(
          padding: EdgeInsets.all(Insets.s6.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primary.withValues(alpha: 0.06),
          ),
          child: Icon(icon, color: ColorManager.primary, size: Sizes.s14.r),
        ),
      ),
    );
  }
}
