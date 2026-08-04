import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget customHeader({
  BuildContext? context,
  List<Widget>? actions,
  bool leading = true,
  String title = 'Stylish',
  double height = kToolbarHeight,
  VoidCallback? onMenuPressed,
  VoidCallback? onProfilePressed,
}) => AppBar(
  toolbarHeight: height.h,
  scrolledUnderElevation: 0.0,
  elevation: 0,
  backgroundColor: ColorManager.white,
  centerTitle: true, // جعل اللوجو والعنوان في المنتصف تماماً
  // 1️⃣ أيقونة القائمة الجانبية (Left Leading)
  leading: leading
      ? IconButton(
          onPressed: onMenuPressed ?? () {},
          icon: Icon(
            Icons.notes_rounded, // أيقونة المنيو المتطابقة مع التصميم
            color: const Color(0xFF323232),
            size: 26.sp,
          ),
        )
      : null,

  // 2️⃣ شعار التطبيق (Center Logo + Title)
  title: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // أيقونة اللوجو الملونة (أو استبدالها بـ Image.asset("assets/images/logo.png"))
      Container(
        width: 32.w,
        height: 32.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFA71CD), Color(0xFFC471ED), Color(0xFFF6416C)],
          ),
        ),
        child: Center(
          child: Icon(
            Icons.all_inclusive_rounded,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      SizedBox(width: 8.w),
      Text(
        title,
        style: getBoldStyle(
          color: const Color(0xFF4392F9), // اللون الأزرق لشعار Stylish
          fontsize: FontSize.s18.sp,
        ),
      ),
    ],
  ),

  // 3️⃣ صورة أفتار المستخدم على اليمين (Right Action)
  actions:
      actions ??
      [
        Padding(
          padding: EdgeInsets.only(right: Insets.s16.w),
          child: GestureDetector(
            onTap: onProfilePressed,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=47', // مسار صورة البروفايل
              ),
            ),
          ),
        ),
      ],
);
