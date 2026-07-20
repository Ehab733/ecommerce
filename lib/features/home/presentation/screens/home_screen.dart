// lib/features/home/presentation/screens/home_screen.dart
import 'package:ecommerce/core/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce/core/widgets/produc_cart.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_header.dart';
import 'package:ecommerce/features/home/presentation/widgets/main_banner.dart';
import 'package:ecommerce/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(background: CustomHeader()),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const MainBanner(),
              const CategoriesSection(),
              const SectionHeader(title: "Home Appliance"),
              productHorizontalList(),
              const SectionHeader(title: "New Arrival"),
              productHorizontalList(),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

Widget productHorizontalList() {
  return SizedBox(
    height: 230, // ارتفاع ثابت للـ List لضمان عرض الـ Cards بشكل كامل
    child: ListView.builder(
      scrollDirection: Axis.horizontal, // التمرير الأفقي
      itemCount: 6, // عدد المنتجات التي ستظهر
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        return const ProductCard(); // استدعاء الكارد الواحد
      },
    ),
  );
}
