import 'dart:math' as math;

import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;

  late AnimationController _textController;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _navigateToNextScreen();
  }

  void _initAnimation() {
    // 1️⃣ تحكم أنيميشن اللوجو (دوران وانبثاق ناعم)
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOutBack),
      ),
    );

    _logoRotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.85, curve: Curves.easeOutCubic),
      ),
    );

    // 2️⃣ تحكم أنيميشن ظهور النص والشعار
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    // 3️⃣ أنيميشن نبض الوهج خلف اللوجو
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _logoController.forward().then((_) {
      if (mounted) {
        _textController.forward();
      }
    });
  }

  // 📌 التوجيه الذكي
  Future<void> _navigateToNextScreen() async {
    try {
      final results = await Future.wait([
        SharedPreferences.getInstance(),
        Future.delayed(const Duration(milliseconds: 2800)),
      ]);

      if (!mounted) return;

      final prefs = results[0] as SharedPreferences;
      final isFirstTime = prefs.getBool('is_first_time') ?? true;
      final token = prefs.getString(CasheConstants.tokenKey);
      final hasToken = token != null && token.isNotEmpty;

      if (mounted) {
        if (isFirstTime) {
          context.go(Routes.onboarding);
        } else {
          context.go(hasToken ? Routes.getStartd : Routes.login);
        }
      }
    } catch (_) {
      if (mounted) {
        context.go(Routes.login);
      }
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FF),
      body: Stack(
        children: [
          // 🎨 1. خلفية زجاجية فاخرة بتدرج ناعم جداً
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.2),
                  radius: 1.2,
                  colors: [
                    ColorManager.primary.withValues(alpha: 0.08),
                    ColorManager.secondary.withValues(alpha: 0.03),
                    const Color(0xFFFAF9FF),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // 🌟 2. المحتوى الرئيسي بالمنتصف
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // اللوجو الفاخر المتداخل مع تأثير الوهج
                AnimatedBuilder(
                  animation: Listenable.merge([
                    _logoController,
                    _pulseController,
                  ]),
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _logoScaleAnimation.value,
                      child: Transform.rotate(
                        angle: _logoRotationAnimation.value * math.pi * 2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // وهج مضيء نبضي خلف الشعار
                            Transform.scale(
                              scale: _pulseAnimation.value,
                              child: Container(
                                width: 110.w,
                                height: 110.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.primary.withValues(
                                    alpha: 0.12,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.15,
                                      ),
                                      blurRadius: 30,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // الدوائر المتداخلة للشعار
                            SizedBox(
                              width: 86.w,
                              height: 86.h,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 2,
                                    top: 2,
                                    child: Container(
                                      width: 54.w,
                                      height: 54.h,
                                      decoration: BoxDecoration(
                                        color: ColorManager.secondary,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorManager.secondary
                                                .withValues(alpha: 0.3),
                                            blurRadius: 12,
                                            offset: const Offset(2, 4),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 2,
                                    bottom: 2,
                                    child: Container(
                                      width: 54.w,
                                      height: 54.h,
                                      decoration: BoxDecoration(
                                        color: ColorManager.primary,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorManager.primary
                                                .withValues(alpha: 0.35),
                                            blurRadius: 16,
                                            offset: const Offset(-2, 4),
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
                  },
                ),

                SizedBox(height: Sizes.s28.h),

                // النص الاسمي للعلامة التجارية والشعار الفرعي
                FadeTransition(
                  opacity: _textFadeAnimation,
                  child: SlideTransition(
                    position: _textSlideAnimation,
                    child: Column(
                      children: [
                        Text(
                          'Stylish',
                          style: getBoldStyle(
                            color: ColorManager.text,
                            fontsize: FontSize.s32.sp,
                          ).copyWith(letterSpacing: 1.2, height: 1.0),
                        ),
                        SizedBox(height: Sizes.s8.h),
                        Text(
                          'Elegance in Every Detail',
                          style: getMediumStyle(
                            color: ColorManager.grey,
                            fontsize: FontSize.s12.sp,
                          ).copyWith(letterSpacing: 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ⏳ 3. مؤشر تحكم سفلي أنيق ونحيف
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _textFadeAnimation,
                child: SizedBox(
                  width: 32.w,
                  height: 3.h,
                  child: LinearProgressIndicator(
                    backgroundColor: ColorManager.lightGrey.withValues(
                      alpha: 0.4,
                    ),
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
