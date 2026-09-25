import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final String totalPrice;
  final String title;
  final IconData? iconLeading;
  final IconData? iconTrailing;
  final VoidCallback onClicked;
  final bool isLoading;

  const BottomBar({
    super.key,
    required this.totalPrice,
    required this.onClicked,
    required this.title,
    this.iconLeading,
    this.iconTrailing,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.s20.w,
        vertical: Insets.s14.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.s28.r),
          topRight: Radius.circular(Sizes.s28.r),
        ),
        border: Border(
          top: BorderSide(
            color: ColorManager.primary.withValues(alpha: 0.08),
            width: 1.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withValues(alpha: 0.06),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // 1️⃣ تفاصيل السعر الإجمالي
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Total Price',
                      style: getMediumStyle(
                        color: ColorManager.grey,
                        fontsize: FontSize.s11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Sizes.s2.h),
                Text(
                  totalPrice,
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s20.sp,
                  ),
                ),
              ],
            ),

            SizedBox(width: Sizes.s20.w),

            // 2️⃣ زر التفاعل والتأكيد العصري (Modern Gradient Action Button)
            Expanded(
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.s18.r),
                  gradient: LinearGradient(
                    colors: isLoading
                        ? [
                            ColorManager.primary.withValues(alpha: 0.6),
                            ColorManager.primaryDark.withValues(alpha: 0.6),
                          ]
                        : [ColorManager.primary, ColorManager.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      spreadRadius: -2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: isLoading ? null : onClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.s18.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: Insets.s16.w),
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 22.r,
                          height: 22.r,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: ColorManager.white,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (iconLeading != null) ...[
                              Icon(
                                iconLeading,
                                color: ColorManager.white,
                                size: 20.sp,
                              ),
                              SizedBox(width: Sizes.s8.w),
                            ],
                            Flexible(
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s15.sp,
                                ),
                              ),
                            ),
                            if (iconTrailing != null) ...[
                              SizedBox(width: Sizes.s8.w),
                              Icon(
                                iconTrailing,
                                color: ColorManager.white,
                                size: 20.sp,
                              ),
                            ],
                          ],
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
