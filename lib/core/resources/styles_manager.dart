import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Helper Function لكتابة كود نظيف وتجنب التكرار
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) =>
    GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );

/// 1. Light Style (FontWeight.w300)
TextStyle getLightStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.light, color);

/// 2. Regular Style (FontWeight.w400)
TextStyle getRegularStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.regular, color);

/// 3. Medium Style (FontWeight.w500)
TextStyle getMediumStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.medium, color);

/// 4. SemiBold Style (FontWeight.w600)
TextStyle getSemiBoldStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.semiBold, color);

/// 5. Bold Style (FontWeight.w700)
TextStyle getBoldStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.bold, color);

/// 6. Strikethrough Style (مفيد جداً لأسعار المنتجات قبل الخصم)
TextStyle getTextWithLine({double? fontsize, Color? color}) {
  final effectiveColor = color ?? ColorManager.grey;
  return GoogleFonts.poppins(
    color: effectiveColor,
    fontSize: fontsize ?? FontSize.s12,
    fontWeight: FontWeightManager.regular,
    decoration: TextDecoration.lineThrough,
    decorationColor: effectiveColor,
  );
}
