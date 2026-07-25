import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
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
    const darkBlueColor = Color(0xFF003F6F);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: getMediumStyle(
            color: ColorManager.text,
            fontsize: FontSize.s18,
          ),
        ),
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(sizes.length, (index) {
              final isSelected = selectedIndex == index;
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () => onSizeSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 42.r,
                    width: 42.r,
                    decoration: BoxDecoration(
                      color: isSelected ? darkBlueColor : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          color: isSelected
                              ? ColorManager.white
                              : ColorManager.text,
                          fontSize: FontSize.s14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
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
