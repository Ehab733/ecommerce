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
    this.wight, this.textColor, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          wight ?? MediaQuery.of(context).size.width,
          height ?? Sizes.s60.h,
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(Insets.s14.sp),
        ),
        backgroundColor: backgroundColor ?? ColorManager.white,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: getSemiBoldStyle(
          color: textColor ?? ColorManager.text,
          fontsize: FontSize.s20,
        ),
      ),
    );
  }
}
