import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce/core/widgets/custom_search.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen_content.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // 2. قائمة الصفحات الأساسية في التطبيق
  final List<Widget> screens = [
    const HomeScreenContent(),
    const HomeScreenContent(),
    const HomeScreenContent(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHeader(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          if (currentIndex != 3)
            SliverAppBar(
              pinned: true,
              scrolledUnderElevation: 0.0,
              surfaceTintColor: Colors.transparent,
              toolbarHeight: 80.h,
              backgroundColor: ColorManager.white,
              title: customSearch(context),
            ),

          screens[currentIndex],
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
