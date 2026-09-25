import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorIndicator({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s24.w,
          vertical: Insets.s24.h,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Insets.s20.w,
          vertical: Insets.s16.h,
        ),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(Sizes.s24.r),
          border: Border.all(
            color: ColorManager.error.withValues(alpha: 0.12),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.error.withValues(alpha: 0.06),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ⚠️ 1. أيقونة الخطأ المضيئة مع طبقات الخلفية
            Container(
              padding: EdgeInsets.all(Insets.s12.r),
              decoration: BoxDecoration(
                color: ColorManager.error.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(Insets.s10.r),
                decoration: BoxDecoration(
                  color: ColorManager.error.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: ColorManager.error,
                  size: 32.sp,
                ),
              ),
            ),

            SizedBox(height: Sizes.s14.h),

            // 📝 2. عنوان الخطأ الرئيسي
            Text(
              'Oops! Something went wrong',
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: ColorManager.textPrimary,
                fontsize: FontSize.s16.sp,
              ),
            ),

            SizedBox(height: Sizes.s8.h),

            // 📄 3. تفاصيل نص الخطأ
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.grey,
                fontsize: FontSize.s12.sp,
              ).copyWith(height: 1.35),
            ),

            // 🔄 4. زر إعادة المحاولة العصري
            if (onRetry != null) ...[
              SizedBox(height: Sizes.s20.h),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onRetry,
                  borderRadius: BorderRadius.circular(Sizes.s20.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.s20.w,
                      vertical: Insets.s10.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.error.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(Sizes.s20.r),
                      border: Border.all(
                        color: ColorManager.error.withValues(alpha: 0.3),
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          size: 16.sp,
                          color: ColorManager.error,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Try Again',
                          style: getBoldStyle(
                            color: ColorManager.error,
                            fontsize: FontSize.s13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
