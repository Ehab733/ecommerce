import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/deal_of_the_daysection.dart';
import 'package:ecommerce/features/home/presentation/widgets/main_banner.dart';
import 'package:ecommerce/features/home/presentation/widgets/promo_banner_card.dart';
import 'package:ecommerce/features/home/presentation/widgets/special_offers_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة العناصر المكونة للشاشة الرئيسية بنسق متناسق وفاخر
    final List<Widget> homeWidgets = [
      // 1️⃣ قسم الأقسام الرئيسية والـ Sort & Filter
      const CategoriesSection(),
      SizedBox(height: Sizes.s18.h),

      // 2️⃣ البنر الرئيسي للتخفيضات المتحرك (Main Banner)
      const MainBanner(),
      SizedBox(height: Sizes.s18.h),

      // 3️⃣ قسم صفقة اليوم (Deal of the Day) مع العداد التنازلي
      const DealOfTheDaySection(),
      SizedBox(height: Sizes.s18.h),

      // 4️⃣ قسم العروض الخاصة (Special Offers)
      SpecialOffersBanner(
        onTap: () {
          context.push(Routes.products);
        },
      ),
      SizedBox(height: Sizes.s18.h),

      // 5️⃣ بنر الأحذية (Flat and Heels)
      PromoBannerCard(
        title: 'Flat and Heels',
        subtitle: 'Stand a chance to get rewarded',
        buttonText: 'Visit now',
        imageUrl:
            'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?q=80&w=600',
        onTap: () {
          context.push(Routes.products);
        },
      ),
      SizedBox(height: Sizes.s18.h),

      // 6️⃣ بنر مجموعات الصيف الحديثة (New Arrivals)
      PromoBannerCard(
        title: 'New Arrivals',
        subtitle: 'Summer’ 26 Collections',
        buttonText: 'View all',
        imageUrl:
            'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600',
        backgroundColor: ColorManager.primary.withValues(alpha: 0.04),
        onTap: () {
          context.push(Routes.products);
        },
      ),
    ];

    return SliverPadding(
      padding: EdgeInsets.only(top: Insets.s12.h, bottom: Insets.s24.h),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => homeWidgets[index],
          childCount: homeWidgets.length,
        ),
      ),
    );
  }
}
// const SectionHeader(title: "Home Appliance"),
// productHorizontalList(),
// const SectionHeader(title: "New Arrival"),
// productHorizontalList(),

// Widget productHorizontalList() {
//   List<String> productImages = [
//     ImageAssets.product,
//     ImageAssets.product1,
//     ImageAssets.product2,
//   ];
//   return SizedBox(
//     height: 280.h, // ارتفاع ثابت للـ List لضمان عرض الـ Cards بشكل كامل
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       // التمرير الأفقي
//       itemCount: productImages.length, // عدد المنتجات التي ستظهر
//       padding: const EdgeInsets.symmetric(horizontal: 16).r,
//       itemBuilder: (_, index) {
//         return Row(
//           children: [
//             // ProductCard(imageURL: productImages[index]),
//             SizedBox(width: Sizes.s16.w),
//           ],
//         ); // استدعاء الكارد الواحد
//       },
//     ),
//   );
// }
