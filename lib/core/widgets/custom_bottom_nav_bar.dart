import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int index)? onTap;
  final int currentIndex;
  const CustomBottomNavBar({super.key, this.onTap, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      // جعل الزوايا العلوية دائرية
      decoration: BoxDecoration(
        color: ColorManager.primary, // اللون الأزرق الداكن من التصميم
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.s20.r),
          topRight: Radius.circular(Sizes.s20.r),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors
            .transparent, // لجعل خلفية الـ bar شفافة ليظهر لون الـ Container
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex, // يمكنك ربطه بـ State لاحقاً
        onTap: onTap,
        items: [
          // أيقونة الـ Home الدائرية (مفعلة)
          BottomNavigationBarItem(
            activeIcon: activeIcon(Icons.home_outlined),
            icon: Icon(
              Icons.home_outlined,
              color: ColorManager.white,
              size: Sizes.s24.r,
            ),

            label: "Home",
          ),
          // باقي الأيقونات
          BottomNavigationBarItem(
            activeIcon: activeIcon(Icons.grid_view_rounded),
            icon: Icon(
              Icons.grid_view_rounded,
              color: ColorManager.white,
              size: Sizes.s24.r,
            ),

            label: "Categories",
          ),
          BottomNavigationBarItem(
            activeIcon: activeIcon(Icons.favorite_border),
            icon: Icon(
              Icons.favorite_border,
              color: ColorManager.white,
              size: Sizes.s24.r,
            ),

            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            activeIcon: activeIcon(Icons.person_outline),
            icon: Icon(
              Icons.person_outline,
              color: ColorManager.white,
              size: Sizes.s24.r,
            ),

            label: "Profile",
          ),
        ],
      ),
    );
  }
}

Widget activeIcon(IconData iconData) => Container(
  padding: EdgeInsets.all(Insets.s8.sp),
  decoration: const BoxDecoration(
    color: ColorManager.white,
    shape: BoxShape.circle,
  ),
  child: Icon(iconData, color: ColorManager.primary, size: Sizes.s24.r),
);
