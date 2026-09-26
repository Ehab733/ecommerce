import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoDetailsArguments {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;

  const PromoDetailsArguments({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.description =
        'Explore our exclusive handpicked curation designed to elevate your everyday style with unmatched elegance.',
  });
}

class PromoDetailsScreen extends StatelessWidget {
  final PromoDetailsArguments arguments;

  const PromoDetailsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // صورة العرض البانرية العلوية مع زر الرجوع
          SliverAppBar(
            expandedHeight: 380.h,
            pinned: true,
            backgroundColor: ColorManager.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(Insets.s8.r),
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.8),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorManager.textPrimary,
                    size: Sizes.s16.sp,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(arguments.imageUrl, fit: BoxFit.cover),
            ),
          ),

          // تفاصيل الـ Promo بستايل Minimal Luxury
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Insets.s24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.s10.w,
                          vertical: Insets.s4.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(Sizes.s8.r),
                        ),
                        child: Text(
                          'FEATURED PROMO',
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontsize: FontSize.s10.sp,
                          ).copyWith(letterSpacing: 1.1),
                        ),
                      ),
                      Text(
                        'Limited Collection',
                        style: getMediumStyle(
                          color: ColorManager.grey,
                          fontsize: FontSize.s12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.s16.h),
                  Text(
                    arguments.title,
                    style: getBoldStyle(
                      color: ColorManager.textPrimary,
                      fontsize: FontSize.s24.sp,
                    ),
                  ),
                  SizedBox(height: Sizes.s8.h),
                  Text(
                    arguments.subtitle,
                    style: getMediumStyle(
                      color: ColorManager.primary,
                      fontsize: FontSize.s14.sp,
                    ),
                  ),
                  SizedBox(height: Sizes.s20.h),
                  Divider(color: ColorManager.grey.withValues(alpha: 0.2)),
                  SizedBox(height: Sizes.s20.h),
                  Text(
                    'About This Curation',
                    style: getBoldStyle(
                      color: ColorManager.textPrimary,
                      fontsize: FontSize.s16.sp,
                    ),
                  ),
                  SizedBox(height: Sizes.s8.h),
                  Text(
                    arguments.description,
                    style: getRegularStyle(
                      color: ColorManager.grey,
                      fontsize: FontSize.s13.sp,
                    ).copyWith(height: 1.5),
                  ),
                  SizedBox(height: Sizes.s40.h),

                  // زر تفاعلي لاستعراض المنتجات الخاصة بهذا البنر
                  SizedBox(
                    width: double.infinity,
                    height: Sizes.s50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.textPrimary,
                        foregroundColor: ColorManager.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s14.r),
                        ),
                      ),
                      onPressed: () {
                        // يمكنك هنا التوجيه لشاشة المنتجات أو عرض المنتجات المخصصة للبنر
                      },
                      child: Text(
                        'Explore Collection Items',
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontsize: FontSize.s14.sp,
                        ),
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
