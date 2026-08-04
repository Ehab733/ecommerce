import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontWeightManager {
  const FontWeightManager._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

abstract class FontSize {
  const FontSize._();

  // 💡 استخدام Getter يضمن حساب الـ .sp في الوقت الصحيح بعد ScreenUtilInit
  static double get s0 => 0.0;
  static double get s10 => 10.0.sp;
  static double get s11 => 11.0.sp;
  static double get s12 => 12.0.sp;
  static double get s13 => 13.0.sp;
  static double get s14 => 14.0.sp;
  static double get s15 => 15.0.sp;
  static double get s16 => 16.0.sp;
  static double get s17 => 17.0.sp;
  static double get s18 => 18.0.sp;
  static double get s20 => 20.0.sp;
  static double get s22 => 22.0.sp;
  static double get s24 => 24.0.sp;
  static double get s28 => 28.0.sp;
  static double get s32 => 32.0.sp;
}
