import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({super.key});

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFF03E51);

    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 3, // عدد البنرات المعروضة
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: Insets.s16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFAEBA), // خلفية وردية متطابقة مع التصميم
                  borderRadius: BorderRadius.circular(Sizes.s12.r),
                ),
                child: Stack(
                  children: [
                    // صورة البنت المنتجة بالجانب الأيمن (تستبدل بـ AssetImage أو Image.network)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Sizes.s12.r),
                          bottomRight: Radius.circular(Sizes.s12.r),
                        ),
                        child: Image.network(
                          'https://freepngimg.com/save/163483-model-shopping-holding-bags-girl-free-download-png-hd/800x1200', // مسار الصورة المصممة
                          fit: BoxFit.cover,
                          width: 170.w,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(),
                        ),
                      ),
                    ),

                    // المحتوى والنصوص بالجانب الأيسر
                    Padding(
                      padding: EdgeInsets.all(Insets.s16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "50-40% OFF",
                            style: getBoldStyle(
                              color: Colors.white,
                              fontsize: FontSize.s22.sp,
                            ),
                          ),
                          SizedBox(height: Sizes.s4.h),
                          Text(
                            "Now in (product)\nAll colours",
                            style: getRegularStyle(
                              color: Colors.white,
                              fontsize: FontSize.s12.sp,
                            ).copyWith(height: 1.2),
                          ),
                          SizedBox(height: Sizes.s12.h),

                          // زر Shop Now ➔
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Sizes.s8.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.s12.w,
                                vertical: Insets.s6.h,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Shop Now",
                                  style: getSemiBoldStyle(
                                    color: Colors.white,
                                    fontsize: FontSize.s12.sp,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ],
                            ),
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

        SizedBox(height: Sizes.s12.h),

        // 🔘 مؤشر التنقل بين الصفحات (Page Indicators)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              width: _currentPage == index ? 10.w : 7.w,
              height: _currentPage == index ? 10.h : 7.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? primaryRed
                    : const Color(0xFFD9D9D9),
              ),
            );
          }),
        ),
      ],
    );
  }
}