import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(double fontsize, FontWeight fontWeight, Color color) =>
    GoogleFonts.poppins(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color,
    );

TextStyle getLightStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.light, color);

TextStyle getRegularStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.regular, color);

TextStyle getMediumStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.medium, color);

TextStyle getSemiBoldStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.semiBold, color);

TextStyle getBoldStyle({double? fontsize, required Color color}) =>
    _getTextStyle(fontsize ?? FontSize.s16, FontWeightManager.bold, color);

TextStyle getTextWithLine() => GoogleFonts.poppins(
  color: ColorManager.primary,
  fontSize: FontSize.s12,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.lineThrough,
  decorationColor: ColorManager.primary,
);
