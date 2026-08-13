import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;
  const ErrorIndicator({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s20.w,
          vertical: Insets.s16.h,
        ),
        margin: EdgeInsets.all(Insets.s16.r),
        decoration: BoxDecoration(
          color: ColorManager.error.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(Insets.s16.r),
          border: Border.all(
            color: ColorManager.error.withValues(alpha: 0.2),
            width: 1.1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: ColorManager.error,
              size: 36.r,
            ),
            SizedBox(height: Sizes.s8.h),

            // استخدام Flexible لمنع النص من تجاوز حدود الـ Column
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  maxLines: 4, // تحديد أقصى عدد للسطور إذا لزم الأمر
                  overflow: TextOverflow
                      .ellipsis, // وضع نقاط (...) إذا كان النص أطول من المساحة
                  style: getMediumStyle(
                    color: ColorManager.error,
                    fontsize: FontSize.s14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
