import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const SectionHeader({super.key, required this.title, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.s16.w,
        vertical: Insets.s8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getBoldStyle(
              color: ColorManager.primary,
              fontsize: FontSize.s18.sp,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(Insets.s5.r),
            onTap: onViewAllTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s5.w,
                vertical: Insets.s2.h,
              ),
              child: Text(
                "view all",
                style: getRegularStyle(
                  color: ColorManager.primary.withAlpha(200),
                  fontsize: FontSize.s14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
