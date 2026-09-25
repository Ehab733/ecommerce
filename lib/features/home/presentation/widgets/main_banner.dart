import 'dart:async';

import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBanner extends StatefulWidget {
  final List<BannerItemModel>? banners;

  const MainBanner({super.key, this.banners});

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  int _currentPage = 0;
  late final PageController _pageController;
  Timer? _timer;

  final List<Map<String, String>> _defaultBanners = const [
    {
      'discount': '50-40% OFF',
      'title': 'Now in (product)\nAll colours',
      'image':
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=800&auto=format&fit=crop',
    },
    {
      'discount': '30% OFF',
      'title': 'New Summer\nCollection 2026',
      'image':
          'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=800&auto=format&fit=crop',
    },
    {
      'discount': 'FLAT 50%',
      'title': 'Limited Time Offer\nGrab Yours!',
      'image':
          'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=800&auto=format&fit=crop',
    },
  ];

  @override
  void initState() {
    super.initState();
    // إتاحة رؤية طرف البنر القادم لمظهر احترافي وواسع
    _pageController = PageController(viewportFraction: 0.90);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % _defaultBanners.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1️⃣ منطقة البنرات المنزلقة الفاخرة
        SizedBox(
          height: 196.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _defaultBanners.length,
            itemBuilder: (context, index) {
              final item = _defaultBanners[index];
              final isCurrent = _currentPage == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(
                  horizontal: Insets.s6.w,
                  vertical: isCurrent ? 0 : 4.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.s20.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(
                        alpha: isCurrent ? 0.22 : 0.08,
                      ),
                      blurRadius: isCurrent ? 16 : 8,
                      spreadRadius: -2,
                      offset: Offset(0, isCurrent ? 8 : 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.s20.r),
                  child: Stack(
                    children: [
                      // 🖼️ 1. صورة الخلفية مع تحسين الاستجابة
                      Positioned.fill(
                        child: Image.network(
                          item['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: ColorManager.primary,
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: ColorManager.white.withValues(
                                    alpha: 0.5,
                                  ),
                                  size: Sizes.s40.sp,
                                ),
                              ),
                        ),
                      ),

                      // 🎨 2. تدرج لوني مظلم زجاجي متناسق
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.black.withValues(alpha: 0.85),
                                ColorManager.black.withValues(alpha: 0.4),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),

                      // 📝 3. محتوى النصوص وأزرار التفاعل
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.s20.w,
                          vertical: Insets.s16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 🏷️ شارة نسبة الخصم الفاخرة
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s12.w,
                                vertical: Insets.s5.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.circular(
                                  Sizes.s14.r,
                                ),
                              ),
                              child: Text(
                                item['discount']!,
                                style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s11.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: Sizes.s12.h),

                            // عنوان الإعلان
                            Text(
                              item['title']!,
                              style: getBoldStyle(
                                color: ColorManager.white,
                                fontsize: FontSize.s18.sp,
                              ).copyWith(height: 1.25),
                            ),
                            SizedBox(height: Sizes.s14.h),

                            // 🔘 زر Shop Now العصري
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(
                                  Sizes.s20.r,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Insets.s16.w,
                                    vertical: Insets.s8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.circular(
                                      Sizes.s20.r,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorManager.black.withValues(
                                          alpha: 0.12,
                                        ),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Shop Now",
                                        style: getBoldStyle(
                                          color: ColorManager.primary,
                                          fontsize: FontSize.s12.sp,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
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
            },
          ),
        ),

        SizedBox(height: Sizes.s14.h),

        // 2️⃣ مؤشرات الصفحات المحدثة بنقاط ديناميكية
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_defaultBanners.length, (index) {
            final isSelected = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: isSelected ? 26.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.s4.r),
                color: isSelected
                    ? ColorManager.primary
                    : ColorManager.primary.withValues(alpha: 0.18),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class BannerItemModel {
  final String discount;
  final String title;
  final String imageUrl;

  const BannerItemModel({
    required this.discount,
    required this.title,
    required this.imageUrl,
  });
}
