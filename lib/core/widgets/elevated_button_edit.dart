import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonEdit extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ElevatedButtonEdit({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, Sizes.s60.h),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(Insets.s14.sp),
        ),
        backgroundColor: ColorManager.white,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: getSemiBoldStyle(
          color: ColorManager.text,
          fontsize: FontSize.s20,
        ),
      ),
    );
  }
}
