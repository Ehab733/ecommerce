import 'dart:ui';

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Stack(
        children: [
          // 🖼️ 1. صورة الخلفية عالية الجودة مع تأثير الزوم الخفيف
          Positioned.fill(
            child: Image.asset(
              ImageAssets.startedBg,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: ColorManager.black,
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: ColorManager.white.withValues(alpha: 0.3),
                      size: 64.sp,
                    ),
                  ),
                );
              },
            ),
          ),

          // 🎨 2. طبقات التدرج الظلي البصري (Multi-Layer Cinematic Gradient)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorManager.black.withValues(alpha: 0.25),
                    ColorManager.black.withValues(alpha: 0.1),
                    ColorManager.black.withValues(alpha: 0.6),
                    ColorManager.black.withValues(alpha: 0.95),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // 🏛️ 3. المحتوى الرئيسي والعناصر الزجاجية
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s24.w,
                vertical: Insets.s20.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 💎 شارة العرض العليا الزجاجية (Glassmorphic Header Tag)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.s32.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s16.w,
                            vertical: Insets.s8.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(Sizes.s32.r),
                            border: Border.all(
                              color: ColorManager.white.withValues(alpha: 0.25),
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8.r,
                                height: 8.r,
                                decoration: const BoxDecoration(
                                  color: ColorManager.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'NEW COLLECTION 2026',
                                style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 📝 الجزء السفلي: النصوص والزر العصري
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // العنوان الرئيسي بتصميم فخم
                          Text(
                            'You Want\nAuthentic,\nHere You Go.',
                            style: getBoldStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s32.sp,
                            ).copyWith(height: 1.1, letterSpacing: -0.5),
                          ),

                          SizedBox(height: Sizes.s12.h),

                          // النص الفرعي
                          Text(
                            'Discover premium quality products from top brands. Find it here, buy it now!',
                            style: getMediumStyle(
                              color: ColorManager.white.withValues(alpha: 0.75),
                              fontsize: FontSize.s13.sp,
                            ).copyWith(height: 1.4),
                          ),

                          SizedBox(height: Sizes.s28.h),

                          // 🚀 الزر التفاعلي المضيء (Glass Action Capsule)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.s50.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                height: 60.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorManager.primary,
                                      ColorManager.primary.withValues(
                                        alpha: 0.85,
                                      ),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s50.r,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.45,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      EasyLoading.show(
                                        status: 'Loading...',
                                        dismissOnTap: false,
                                        maskType: EasyLoadingMaskType.black,
                                        options: EasyLoadingOptions(
                                          userInteractions: false,
                                        ),
                                      );
                                      await Future.delayed(
                                        const Duration(seconds: 2),
                                      );
                                      await EasyLoading.dismiss();
                                      if (context.mounted) {
                                        context.go(Routes.home);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(
                                      Sizes.s50.r,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Insets.s8.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: Insets.s20.w,
                                            ),
                                            child: Text(
                                              'Get Started',
                                              style: getBoldStyle(
                                                color: ColorManager.white,
                                                fontsize: FontSize.s17.sp,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 46.r,
                                            height: 46.r,
                                            decoration: const BoxDecoration(
                                              color: ColorManager.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              color: ColorManager.primary,
                                              size: 22.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Sizes.s8.h),
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
    );
  }
}
