import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double strokeWidth;
  final String? message;

  const LoadingIndicator({
    super.key,
    this.size,
    this.color,
    this.strokeWidth = 3.0,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? Sizes.s32.r;
    final effectiveColor = color ?? ColorManager.primary;

    final Widget loaderContent = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🌀 1. مؤشر التحميل المزدوج ذو الطبقات الناعمة
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: effectiveSize,
              child: CircularProgressIndicator(
                color: effectiveColor.withValues(alpha: 0.15),
                strokeWidth: strokeWidth,
                value: 1.0,
              ),
            ),
            SizedBox.square(
              dimension: effectiveSize,
              child: CircularProgressIndicator(
                color: effectiveColor,
                strokeWidth: strokeWidth,
                strokeCap: StrokeCap.round,
              ),
            ),
          ],
        ),

        // 📝 2. نص رسالة الانتظار
        if (message != null) ...[
          SizedBox(height: Sizes.s14.h),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: getMediumStyle(
              color: ColorManager.textPrimary,
              fontsize: FontSize.s13.sp,
            ).copyWith(height: 1.2),
          ),
        ],
      ],
    );

    // إذا وُجدت رسالة نصية، نضع الودجيت داخل كارت ناعم وفاخر
    if (message != null) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s24.w,
            vertical: Insets.s20.h,
          ),
          margin: EdgeInsets.symmetric(horizontal: Insets.s20.w),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(Sizes.s20.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.08),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.primary.withValues(alpha: 0.06),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: loaderContent,
        ),
      );
    }

    return Center(child: loaderContent);
  }
}
