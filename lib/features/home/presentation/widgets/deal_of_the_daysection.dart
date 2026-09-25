import 'dart:async';

import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealOfTheDaySection extends StatefulWidget {
  final VoidCallback? onViewAllPressed;

  const DealOfTheDaySection({super.key, this.onViewAllPressed});

  @override
  State<DealOfTheDaySection> createState() => _DealOfTheDaySectionState();
}

class _DealOfTheDaySectionState extends State<DealOfTheDaySection> {
  late Timer _timer;
  Duration _remainingTime = const Duration(hours: 22, minutes: 55, seconds: 20);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        if (mounted) {
          setState(() {
            _remainingTime = _remainingTime - const Duration(seconds: 1);
          });
        }
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _remainingTime.inHours.toString().padLeft(2, '0');
    final minutes = _remainingTime.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final seconds = _remainingTime.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Insets.s20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.25),
            blurRadius: 18,
            spreadRadius: -2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        child: Stack(
          children: [
            // 🎨 1. الخلفية المتدرجة الفاخرة
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorManager.primary, ColorManager.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // ⚡ 2. أشكال تزيينية زجاجية في الخلفية
            Positioned(
              right: -30.w,
              top: -30.h,
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.white.withValues(alpha: 0.07),
                ),
              ),
            ),
            Positioned(
              left: -20.w,
              bottom: -20.h,
              child: Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.white.withValues(alpha: 0.05),
                ),
              ),
            ),

            // 📝 3. محتوى القسم الداخلي
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s18.w,
                vertical: Insets.s16.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // شارة Hot Deal والعنوان
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s8.w,
                                vertical: Insets.s4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFB300),
                                borderRadius: BorderRadius.circular(
                                  Sizes.s12.r,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: ColorManager.white,
                                    size: 13.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'HOT',
                                    style: getBoldStyle(
                                      color: ColorManager.white,
                                      fontsize: FontSize.s10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Deal of the Day',
                              style: getBoldStyle(
                                color: ColorManager.white,
                                fontsize: FontSize.s16.sp,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Sizes.s14.h),

                        // ⏱️ عداد الوقت العصري المنفصل بتصميم زجاجي
                        Row(
                          children: [
                            _buildTimeBadge(hours),
                            _buildTimeSeparator(),
                            _buildTimeBadge(minutes),
                            _buildTimeSeparator(),
                            _buildTimeBadge(seconds),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 12.w),

                  // 🔘 زر View all الفاخر
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onViewAllPressed,
                      borderRadius: BorderRadius.circular(Sizes.s20.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.s14.w,
                          vertical: Insets.s8.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(Sizes.s20.r),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View all',
                              style: getBoldStyle(
                                color: ColorManager.primary,
                                fontsize: FontSize.s12.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: ColorManager.primary,
                              size: 14.sp,
                            ),
                          ],
                        ),
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

  // 📦 مكعب الوقت بتصميم زجاجي ناعم
  Widget _buildTimeBadge(String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.s10.w,
        vertical: Insets.s5.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(Sizes.s12.r),
        border: Border.all(
          color: ColorManager.white.withValues(alpha: 0.25),
          width: 1.w,
        ),
      ),
      child: Text(
        value,
        style: getBoldStyle(
          color: ColorManager.white,
          fontsize: FontSize.s12.sp,
        ),
      ),
    );
  }

  // <b>:</b> فاصل النقطتين
  Widget _buildTimeSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        ':',
        style: getBoldStyle(
          color: ColorManager.white.withValues(alpha: 0.7),
          fontsize: FontSize.s12.sp,
        ),
      ),
    );
  }
}
