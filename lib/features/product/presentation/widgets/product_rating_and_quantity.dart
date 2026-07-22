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
        // 1️⃣ شارة عدد القطع المباعة (Sold Badge)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorManager.darkBlue.withAlpha(50)),
          ),
          child: Text(
            '$soldCount Sold',
            style: getMediumStyle(
              color: ColorManager.text,
              fontsize: FontSize.s14,
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // 2️⃣ التقييم
        Row(
          children: [
            Icon(Icons.star, color: ColorManager.starRate, size: 18.r),
            SizedBox(width: 4.w),
            Text(
              rating,
              style: getRegularStyle(
                color: ColorManager.text,
                fontsize: FontSize.s14,
              ),
            ),
          ],
        ),

        const Spacer(),

        // 3️⃣ كبسولة تعديل الكمية (Quantity Stepper)
        Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStepperButton(icon: Icons.remove, onTap: onDecrement),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '$quantity',
                  style: getRegularStyle(
                    color: ColorManager.white,
                    fontsize: FontSize.s18,
                  ),
                ),
              ),
              _buildStepperButton(icon: Icons.add, onTap: onIncrement),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method لإعادة استخدام أزرار الـ + والـ - بتنسيق موحد
  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(icon, color: ColorManager.white, size: Sizes.s18.r),
      ),
    );
  }
}
