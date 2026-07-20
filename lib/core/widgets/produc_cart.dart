import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.s120.w + Sizes.s40.w,
      margin: EdgeInsets.only(left: Insets.s16.sp),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF004182), width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.s14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة + زر القلب
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Sizes.s14.r),
                ),
                child: Image.asset(
                  ImageAssets.banner_img,
                  height: Sizes.s120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: SizedBox(
                      height: Sizes.s120.h,
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  width: Sizes.s24.w,
                  height: Sizes.s24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.s40.r),
                    color: ColorManager.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: ColorManager.primary,
                      size: Sizes.s18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // تفاصيل المنتج
          Padding(
            padding: EdgeInsets.all(Insets.s8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nike Air",
                  style: getSemiBoldStyle(color: ColorManager.primary),
                ),
                Row(
                  children: [
                    Text(
                      "Review",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontsize: FontSize.s14,
                      ),
                    ),
                    Text(
                      "(3.3)",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontsize: FontSize.s14,
                      ),
                    ),
                    SizedBox(width: Sizes.s14.w),
                    Icon(Icons.star, color: ColorManager.starRate),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "EGP 1200",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontsize: FontSize.s12,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.add_circle, color: Color(0xFF004182)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
