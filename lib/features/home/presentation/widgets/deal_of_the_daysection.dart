import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s16.w),
      padding: EdgeInsets.symmetric(
        horizontal: Insets.s16.w,
        vertical: Insets.s12.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4392F9), // اللون الأزرق المميز في التصميم
        borderRadius: BorderRadius.circular(Sizes.s11.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deal of the Day',
                style: getMediumStyle(
                  color: Colors.white,
                  fontsize: FontSize.s16.sp,
                ),
              ),
              SizedBox(height: Sizes.s4.h),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '22h 55m 20s remaining',
                    style: getRegularStyle(
                      color: Colors.white.withAlpha(200),
                      fontsize: FontSize.s12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // زر View All ➔
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.s8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s12.w,
                vertical: Insets.s6.h,
              ),
            ),
            child: Row(
              children: [
                Text(
                  'View all',
                  style: getSemiBoldStyle(
                    color: Colors.white,
                    fontsize: FontSize.s12.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}