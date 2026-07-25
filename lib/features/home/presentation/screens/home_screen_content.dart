import 'package:ecommerce/features/home/presentation/widgets/categories_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/main_banner.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const MainBanner(),
        const CategoriesSection(),
        // const SectionHeader(title: "Home Appliance"),
        // productHorizontalList(),
        // const SectionHeader(title: "New Arrival"),
        // productHorizontalList(),
      ]),
    );
  }
}

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
