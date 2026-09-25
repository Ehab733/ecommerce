import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffersBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const SpecialOffersBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s20.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.1),
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
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(Sizes.s20.r),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s16.w,
                vertical: Insets.s14.h,
              ),
              child: Row(
                children: [
                  // 1️⃣ أيقونة العرض المضيئة ذات التدرج اللوني الفاخر
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorManager.primary,
                          ColorManager.primary.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.s18.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.local_offer_rounded,
                      color: ColorManager.white,
                      size: 26.sp,
                    ),
                  ),

                  SizedBox(width: Sizes.s14.w),

                  // 2️⃣ نصوص العنوان والوصف الشارحة
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // شارة LIMITED الصغيرة المحدثة + العنوان الرئيسي
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s8.w,
                                vertical: Insets.s4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFB300),
                                borderRadius: BorderRadius.circular(Sizes.s8.r),
                              ),
                              child: Text(
                                'LIMITED',
                                style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s10.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Flexible(
                              child: Text(
                                'Special Offers',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getBoldStyle(
                                  color: ColorManager.textPrimary,
                                  fontsize: FontSize.s16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Sizes.s8.h),

                        Text(
                          'We make sure you get the offer you need at best prices',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getMediumStyle(
                            color: ColorManager.grey,
                            fontsize: FontSize.s11.sp,
                          ).copyWith(height: 1.3),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: Sizes.s12.w),

                  // 3️⃣ زر سهم التوجيه العصري الدائري
                  Container(
                    width: 34.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.primary.withValues(alpha: 0.08),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: ColorManager.primary,
                      size: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
