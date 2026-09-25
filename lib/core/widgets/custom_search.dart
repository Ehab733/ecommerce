import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSearch({
  TextEditingController? controller,
  ValueChanged<String>? onChanged,
  VoidCallback? onMicPressed,
  VoidCallback? onTap,
  bool readOnly = false,
  String hintText = 'Search any product...',
}) => Padding(
  padding: EdgeInsets.symmetric(
    horizontal: Insets.s16.w,
    vertical: Insets.s8.h,
  ),
  child: Container(
    height: 50.h,
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(Sizes.s16.r),
      border: Border.all(
        color: ColorManager.primary.withValues(alpha: 0.12),
        width: 1.w,
      ),
      boxShadow: [
        BoxShadow(
          color: ColorManager.primary.withValues(alpha: 0.05),
          blurRadius: 16,
          spreadRadius: 0,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Center(
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: getMediumStyle(
          color: ColorManager.textPrimary,
          fontsize: FontSize.s14.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: getRegularStyle(
            color: ColorManager.grey.withValues(alpha: 0.8),
            fontsize: FontSize.s13.sp,
          ),
          // 🔍 أيقونة البحث
          prefixIcon: Padding(
            padding: EdgeInsets.all(Insets.s12.r),
            child: Icon(
              Icons.search_rounded,
              size: 22.sp,
              color: ColorManager.primary,
            ),
          ),
          // 🎙️ زر الميكروفون المطور
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: Insets.s6.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onMicPressed,
                borderRadius: BorderRadius.circular(Sizes.s12.r),
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(Sizes.s12.r),
                  ),
                  child: Icon(
                    Icons.mic_rounded,
                    size: 18.sp,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: Insets.s12.h),
        ),
      ),
    ),
  ),
);
