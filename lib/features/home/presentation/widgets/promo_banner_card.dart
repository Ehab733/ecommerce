import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String imageUrl;
  final Color backgroundColor;
  final VoidCallback onTap;

  const PromoBannerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageUrl,
    this.backgroundColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFF03E51);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s16.w),
      height: 160.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Sizes.s12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s12.r),
        child: Stack(
          children: [
            // صورة البنـر
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 140.w,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey.shade200),
              ),
            ),

            // محتوى ونصوص البنـر بالجانب الأيمن
            Positioned(
              right: 16.w,
              top: 20.h,
              bottom: 20.h,
              left: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: getBoldStyle(
                      color: Colors.black,
                      fontsize: FontSize.s18.sp,
                    ),
                  ),
                  SizedBox(height: Sizes.s4.h),
                  Text(
                    subtitle,
                    style: getRegularStyle(
                      color: const Color(0xFF676767),
                      fontsize: FontSize.s11.sp,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 32.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryRed,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s4.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: Insets.s12.w),
                      ),
                      onPressed: onTap,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            buttonText,
                            style: getSemiBoldStyle(
                              color: Colors.white,
                              fontsize: FontSize.s12.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 12.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
