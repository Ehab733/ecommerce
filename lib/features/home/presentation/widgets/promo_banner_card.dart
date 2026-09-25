import 'package:ecommerce/core/resources/color_manager.dart';
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
    this.backgroundColor = ColorManager.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s20.w),
      height: 164.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.08),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.08),
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        child: Stack(
          children: [
            // 🎨 1. خلفية زينة هندسية دائرية ناعمة
            Positioned(
              right: -25.w,
              top: -25.h,
              child: Container(
                width: 110.w,
                height: 110.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary.withValues(alpha: 0.06),
                ),
              ),
            ),

            Row(
              children: [
                // 🖼️ 2. الصورة في إطار بارز وأنيق مع تدرج خفيف
                Padding(
                  padding: EdgeInsets.all(Insets.s12.w),
                  child: Container(
                    width: 126.w,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.s18.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.s18.r),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: ColorManager.lightGrey.withValues(
                              alpha: 0.2,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 18.w,
                                height: 18.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.w,
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: ColorManager.lightGrey.withValues(alpha: 0.2),
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: ColorManager.grey,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // 📝 3. النصوص والأزرار التفاعلية
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Insets.s14.h,
                      bottom: Insets.s14.h,
                      right: Insets.s16.w,
                      left: Insets.s4.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBoldStyle(
                                color: ColorManager.textPrimary,
                                fontsize: FontSize.s15.sp,
                              ).copyWith(height: 1.2),
                            ),
                            SizedBox(height: Sizes.s8.h),
                            Text(
                              subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getRegularStyle(
                                color: ColorManager.grey,
                                fontsize: FontSize.s11.sp,
                              ).copyWith(height: 1.25),
                            ),
                          ],
                        ),

                        // 🔘 4. زر الرابط السفلي العصري
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: onTap,
                            borderRadius: BorderRadius.circular(Sizes.s14.r),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  buttonText,
                                  style: getBoldStyle(
                                    color: ColorManager.primary,
                                    fontsize: FontSize.s12.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Container(
                                  padding: EdgeInsets.all(Insets.s6.w),
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorManager.primary.withValues(
                                          alpha: 0.3,
                                        ),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: ColorManager.white,
                                    size: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
