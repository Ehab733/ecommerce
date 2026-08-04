import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommerceBackground extends StatelessWidget {
  const EcommerceBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.primary, // 0xFF00416A
            ColorManager.primaryDark, // 0xFF070B19
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -60.h,
            right: -50.w,
            child: CircleAvatar(
              radius: 140.r,
              backgroundColor: ColorManager.white.withValues(alpha: 0.03),
            ),
          ),
          Positioned(
            bottom: -80.h,
            left: -60.w,
            child: CircleAvatar(
              radius: 170.r,
              backgroundColor: ColorManager.white.withValues(alpha: 0.02),
            ),
          ),
          Positioned(
            bottom: 25.h,
            right: -20.w,
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 250.sp,
              color: ColorManager.white.withValues(alpha: 0.02),
            ),
          ),
        ],
      ),
    );
  }
}