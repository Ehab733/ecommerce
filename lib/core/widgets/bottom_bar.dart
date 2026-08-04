import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final String totalPrice;
  final String title;
  final IconData? iconLeading;
  final IconData? iconTrailing;
  final VoidCallback onClicked;

  const BottomBar({
    super.key,
    required this.totalPrice,
    required this.onClicked,
    this.iconLeading,
    this.iconTrailing,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: ColorManager.white, // خلفية بيضاء نظيفة ومميزة للـ BottomBar
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -4), // ظل علوي خفيف يفصل البار عن المحتوى
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // السعر الإجمالي بتنسيق متوازن
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                  style: getMediumStyle(
                    color: ColorManager.primaryDark.withValues(alpha: 0.6),
                    fontsize: FontSize.s14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  totalPrice,
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontsize: FontSize.s20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.w),

            // زر Check Out بتصميم عصري
            Expanded(
              child: ElevatedButton(
                onPressed: onClicked,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 16.w,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (iconLeading != null) ...[
                      Icon(iconLeading, color: ColorManager.white, size: 20.r),
                      SizedBox(width: 8.w),
                    ],
                    Text(
                      title,
                      style: getSemiBoldStyle(
                        color: ColorManager.white,
                        fontsize: FontSize.s18.sp,
                      ),
                    ),
                    if (iconTrailing != null) ...[
                      SizedBox(width: 8.w),
                      Icon(iconTrailing, color: ColorManager.white, size: 20.r),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
