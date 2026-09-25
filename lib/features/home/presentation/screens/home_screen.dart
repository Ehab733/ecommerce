import 'package:ecommerce/core/helpers/splash/catergories_screen.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/core/widgets/custom_search.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen_content.dart';
import 'package:ecommerce/features/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFAF9FF,
      ), // خلفية فاخرة وناعمة متناسقة مع باقي الشاشات
      appBar: customHeader(
        actions: [
          // 🛒 زر السلة بتصميم دائري فاخر مع تأثير خفيف
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.s8.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push(Routes.cart),
                borderRadius: BorderRadius.circular(Sizes.s16.r),
                child: Container(
                  padding: EdgeInsets.all(Insets.s8.r),
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(Sizes.s16.r),
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.12),
                      width: 1.w,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: Sizes.s20.sp,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 🎨 توهج خفيف في الخلفية لتعزيز طابع الفخامة
          Positioned(
            top: -60.h,
            right: -40.w,
            child: Container(
              width: 220.w,
              height: 220.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary.withValues(alpha: 0.05),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.08),
                    blurRadius: 60,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          // المحتوى الأساسي والتبويبات
          IndexedStack(
            index: _currentIndex,
            children: [
              // 🏠 Tab 0: Home Page
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [_buildSliverSearchBar(), const HomeScreenContent()],
              ),

              // 🗂️ Tab 1: Categories Page
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.s20.w,
                      vertical: Insets.s8.h,
                    ),
                    child: customSearch(),
                  ),
                  const Expanded(child: CategoriesTab()),
                ],
              ),

              // ❤️ Tab 2: Wishlist Page
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [_buildSliverSearchBar(), const WishlistTab()],
              ),

              // 👤 Tab 3: Profile Page
              const CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [ProfileScreen()],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              if (_currentIndex != index) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  // 🔍 شريط البحث الثابت أثناء التمرير بتصميم متناسق
  Widget _buildSliverSearchBar() {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 74.h,
      backgroundColor: const Color(0xFFFAF9FF),
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.s4.w),
        child: customSearch(),
      ),
    );
  }
}
