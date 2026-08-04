import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSearch(
  BuildContext context, {
  TextEditingController? controller,
}) => Padding(
  padding: EdgeInsets.symmetric(
    horizontal: Insets.s16.w,
    vertical: Insets.s8.h,
  ),
  child: Container(
    height: 48.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(Sizes.s11.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      controller: controller ?? TextEditingController(),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Search any Product..',
        hintStyle: getRegularStyle(
          color: const Color(0xFFBBBBBB),
          fontsize: FontSize.s14.sp,
        ),
        // 🔍 1️⃣ أيقونة البحث اليسارية
        prefixIcon: Icon(
          Icons.search,
          size: 22.sp,
          color: const Color(0xFFBBBBBB),
        ),
        // 🎙️ 2️⃣ أيقونة الميكروفون اليمينية
        suffixIcon: IconButton(
          icon: Icon(
            Icons.mic_none_rounded,
            size: 22.sp,
            color: const Color(0xFFBBBBBB),
          ),
          onPressed: () {
          },
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
      ),
    ),
  ),
);
