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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHeader(
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: Sizes.s28,
              color: ColorManager.primary,
            ),
            onPressed: () => context.push(Routes.cart),
          ),
        ],
      ),
      backgroundColor: ColorManager.white,
      body: IndexedStack(
        index: currentIndex,
        children: [
          // 🏠 Tab 0: Home Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [_buildSliverSearchBar(), const HomeScreenContent()],
          ),

          // 🗂️ Tab 1: Categories
          // 💡 نضع CategoriesTab مباشرة دون CustomScrollView خارجي لمنع التعارض
          Column(
            children: [
              customSearch(context),
              const Expanded(child: CategoriesTab()),
            ],
          ),

          // ❤️ Tab 2: Wishlist
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [_buildSliverSearchBar(), const WishlistTab()],
          ),

          // 👤 Tab 3: Profile Screen
          const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [ProfileScreen()],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }

  Widget _buildSliverSearchBar() {
    return SliverAppBar(
      pinned: true,
      scrolledUnderElevation: 0.0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 80.h,
      backgroundColor: ColorManager.white,
      title: customSearch(context),
    );
  }
}
