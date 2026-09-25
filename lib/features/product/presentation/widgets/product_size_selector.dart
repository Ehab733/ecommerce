import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> onSizeSelected;

  const ProductSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: getBoldStyle(
            color: ColorManager.textPrimary,
            fontsize: FontSize.s16.sp,
          ),
        ),
        SizedBox(height: Insets.s12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(sizes.length, (index) {
              final isSelected = selectedIndex == index;
              return Padding(
                padding: EdgeInsets.only(right: Insets.s12.w),
                child: GestureDetector(
                  onTap: () => onSizeSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    height: Sizes.s40.r,
                    constraints: BoxConstraints(minWidth: Sizes.s40.r),
                    padding: EdgeInsets.symmetric(horizontal: Insets.s10.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorManager.primary
                          : ColorManager.white,
                      borderRadius: BorderRadius.circular(Sizes.s14.r),
                      border: Border.all(
                        color: isSelected
                            ? ColorManager.primary
                            : ColorManager.primary.withValues(alpha: 0.15),
                        width: 1.w,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: ColorManager.primary.withValues(
                                  alpha: 0.3,
                                ),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: ColorManager.black.withValues(
                                  alpha: 0.02,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Center(
                      child: Text(
                        sizes[index],
                        style: isSelected
                            ? getBoldStyle(
                                color: ColorManager.white,
                                fontsize: FontSize.s13.sp,
                              )
                            : getMediumStyle(
                                color: ColorManager.textPrimary,
                                fontsize: FontSize.s13.sp,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
