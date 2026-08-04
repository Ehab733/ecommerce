import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffersBanner extends StatelessWidget {
  const SpecialOffersBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s16.w),
      padding: EdgeInsets.all(Insets.s12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.s12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // صور الأكياس / Offer Icon
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF2F2),
              borderRadius: BorderRadius.circular(Sizes.s12.r),
            ),
            child: const Icon(
              Icons.local_offer_rounded,
              color: Color(0xFFF03E51),
              size: 32,
            ),
          ),
          SizedBox(width: Sizes.s12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Special Offers',
                      style: getBoldStyle(
                        color: Colors.black,
                        fontsize: FontSize.s16.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '😱',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: Sizes.s4.h),
                Text(
                  'We make sure you get the offer you need at best prices',
                  style: getRegularStyle(
                    color: const Color(0xFF676767),
                    fontsize: FontSize.s11.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}