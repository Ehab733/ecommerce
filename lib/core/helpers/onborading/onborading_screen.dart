import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// موديل الـ Onboarding
class OnboardingModel {
  final String image;
  final String title;
  final String description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: ImageAssets.onBoarding1,
      title: 'Choose Products',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardingModel(
      image: ImageAssets.onBoarding2,
      title: 'Make Payment',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardingModel(
      image: ImageAssets.onBoarding3,
      title: 'Get Your Order',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
  ];

  // 💡 حفظ حالة التخطي والانتقال لشاشة الدخول
  Future<void> _finishOnboarding() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_first_time', false);
      if (mounted) {
        context.go(Routes.login);
      }
    } catch (_) {
      if (mounted) {
        context.go(Routes.login);
      }
    }
  }

  void _onSkip() => _finishOnboarding();

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _onPrev() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentIndex == _pages.length - 1;
    final bool isFirstPage = _currentIndex == 0;

    return PopScope(
      canPop: isFirstPage,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _currentIndex > 0) {
          _onPrev();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: SafeArea(
          child: Column(
            children: [
              // 1️⃣ الشريط العلوي الفاخر: شارة الصفحة + زر التخطي (Skip)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s20.w,
                  vertical: Insets.s12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // شارة العداد الزجاجية
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.s12.w,
                        vertical: Insets.s6.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(Sizes.s20.r),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '0${_currentIndex + 1}',
                              style: getBoldStyle(
                                color: ColorManager.primary,
                                fontsize: FontSize.s15.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' / 0${_pages.length}',
                              style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontsize: FontSize.s13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // زر Skip الأنيق
                    InkWell(
                      onTap: _onSkip,
                      borderRadius: BorderRadius.circular(Sizes.s20.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.s12.w,
                          vertical: Insets.s6.h,
                        ),
                        child: Text(
                          'Skip',
                          style: getBoldStyle(
                            color: ColorManager.text,
                            fontsize: FontSize.s15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 2️⃣ منطقة عرض المحتوى الرئيسي بطابع زجاجي وبطاقات عائمة
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    final isCurrent = index == _currentIndex;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.s20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // أنيميشن تكبير وظهور الصورة
                          AnimatedScale(
                            scale: isCurrent ? 1.0 : 0.85,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutBack,
                            child: AnimatedOpacity(
                              opacity: isCurrent ? 1.0 : 0.4,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                height: 290.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s24.r,
                                  ),
                                ),
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, _, _) => Icon(
                                    Icons.image_outlined,
                                    size: Sizes.s80.sp,
                                    color: ColorManager.lightGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Sizes.s28.h),

                          // بطاقة المحتوى الزجاجية الفاخرة (Glass Floating Card)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.all(Insets.s24.r),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(Sizes.s24.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 24,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              border: Border.all(
                                color: ColorManager.lightGrey.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  item.title,
                                  style: getBoldStyle(
                                    color: ColorManager.text,
                                    fontsize: FontSize.s22.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: Sizes.s12.h),
                                Text(
                                  item.description,
                                  style: getRegularStyle(
                                    color: ColorManager.grey,
                                    fontsize: FontSize.s13.sp,
                                  ).copyWith(height: 1.55),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 3️⃣ الشريط السفلي الفاخر: أزرار تحكم متناسقة ومؤشرات منيرة
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s24.w,
                  vertical: Insets.s20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // زر Prev
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isFirstPage ? 0.2 : 1.0,
                      child: InkWell(
                        onTap: isFirstPage ? null : _onPrev,
                        borderRadius: BorderRadius.circular(Sizes.s12.r),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s12.w,
                            vertical: Insets.s8.h,
                          ),
                          child: Text(
                            'Prev',
                            style: getSemiBoldStyle(
                              color: ColorManager.grey,
                              fontsize: FontSize.s16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // الـ Indicators الحركية ذات الوهج الناعم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_pages.length, (index) {
                        final isSelected = _currentIndex == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          height: 7.h,
                          width: isSelected ? 32.w : 8.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorManager.primary
                                : ColorManager.lightGrey.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(Sizes.s4.r),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.35,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                        );
                      }),
                    ),

                    // زر Next / Get Started بتصميم زري كبسولة تفاعلية
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(Sizes.s32.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.primary.withValues(alpha: 0.35),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _onNext,
                          borderRadius: BorderRadius.circular(Sizes.s32.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Insets.s20.w,
                            ),
                            child: Center(
                              child: AnimatedCrossFade(
                                firstChild: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Next',
                                      style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontsize: FontSize.s15.sp,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: ColorManager.white,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                                secondChild: Text(
                                  'Get Started',
                                  style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontsize: FontSize.s15.sp,
                                  ),
                                ),
                                crossFadeState: isLastPage
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 200),
                              ),
                            ),
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
      ),
    );
  }
}
