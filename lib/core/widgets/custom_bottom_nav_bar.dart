import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int index)? onTap;
  final int currentIndex;

  const CustomBottomNavBar({super.key, this.onTap, this.currentIndex = 0});

  static const List<_NavItem> _navItems = [
    _NavItem(
      label: 'Home',
      activeIcon: Icons.home_rounded,
      inactiveIcon: Icons.home_outlined,
    ),
    _NavItem(
      label: 'Categories',
      activeIcon: Icons.grid_view_rounded,
      inactiveIcon: Icons.grid_view_outlined,
    ),
    _NavItem(
      label: 'Favorites',
      activeIcon: Icons.favorite_rounded,
      inactiveIcon: Icons.favorite_border_rounded,
    ),
    _NavItem(
      label: 'Profile',
      activeIcon: Icons.person_rounded,
      inactiveIcon: Icons.person_outline_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: Insets.s16.w,
        right: Insets.s16.w,
        bottom: bottomPadding > 0 ? bottomPadding : Insets.s12.h,
        top: Insets.s8.h,
      ),
      child: Container(
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: Insets.s8.w),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(Sizes.s32.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primary.withValues(alpha: 0.35),
              blurRadius: 20,
              spreadRadius: -2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_navItems.length, (index) {
            final isSelected = currentIndex == index;
            final item = _navItems[index];

            return InkWell(
              onTap: () => onTap?.call(index),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutBack,
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? Insets.s14.w : Insets.s10.w,
                  vertical: Insets.s8.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? ColorManager.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(Sizes.s24.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? item.activeIcon : item.inactiveIcon,
                      color: isSelected
                          ? ColorManager.primary
                          : ColorManager.white.withValues(alpha: 0.75),
                      size: 22.sp,
                    ),
                    if (isSelected) ...[
                      SizedBox(width: 6.w),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isSelected ? 1.0 : 0.0,
                        child: Text(
                          item.label,
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontsize: FontSize.s12.sp,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const _NavItem({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}
