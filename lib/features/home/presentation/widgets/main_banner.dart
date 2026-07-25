import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
      decoration: BoxDecoration(
        color: Colors.amberAccent, // اللون الأصفر الخاص بالبنر
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage("assets/images/banner.png"), // ضع مسار صورتك هنا
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "UP TO",
              style: getBoldStyle(
                color: ColorManager.primary,
                fontsize: FontSize.s22,
              ),
            ),
            Text(
              "25% OFF",
              style: getBoldStyle(
                color: ColorManager.primary,
                fontsize: FontSize.s22,
              ),
            ),
            Text(
              "For all Headphones\n& AirPods",
              style: getRegularStyle(
                color: ColorManager.primary,
                fontsize: FontSize.s14,
              ),
            ),
            SizedBox(height: Sizes.s12.h),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Insets.s20.r),
                  ),
                ),
                child: Text(
                  "Shop Now",
                  style: getRegularStyle(
                    color: ColorManager.white,
                    fontsize: FontSize.s14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
