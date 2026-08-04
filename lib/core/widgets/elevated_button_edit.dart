import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonEdit extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? height;
  final double? wight;
  final Color? textColor;
  final Color? backgroundColor;

  const ElevatedButtonEdit({
    super.key,
    required this.title,
    this.onPressed,
    this.height,
    this.wight,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wight ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.white,
          elevation: onPressed != null ? 3 : 0, // ظل هادئ وجمالي
          shadowColor: ColorManager.black.withValues(alpha: 0.15),

          // تأثير الضغط باللمس (Ripple Effect)
          overlayColor: (textColor ?? ColorManager.primary).withValues(alpha: 0.12),

          // حواف دائرية متناسقة ونظيفة
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Insets.s16.r),
          ),

          // مساحات داخلية لضمان عدم قطع النص
          padding: EdgeInsets.symmetric(horizontal: Insets.s16.w),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldStyle(
            color: textColor ?? ColorManager.primary,
            fontsize: FontSize.s18.sp,
          ),
        ),
      ),
    );
  }
}
