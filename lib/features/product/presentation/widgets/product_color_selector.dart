import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onColorSelected;

  const ProductColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  /// 💡 التأكد مما إذا كان اللون فاتحاً لتغيير لون الأيقونة وإضافة حدود مناسبة
  bool _isLightColor(Color color) {
    return color.computeLuminance() > 0.6;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
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
            children: List.generate(colors.length, (index) {
              final color = colors[index];
              final isSelected = selectedIndex == index;
              final isLight = _isLightColor(color);

              return Padding(
                padding: EdgeInsets.only(right: Insets.s14.w),
                child: GestureDetector(
                  onTap: () => onColorSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.all(
                      isSelected ? 3.w : 0,
                    ), // تأثير الحلقية الخارجية عند التحديد
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: ColorManager.primary, width: 2.w)
                          : isLight
                          ? Border.all(
                              color: ColorManager.grey.withValues(alpha: 0.25),
                              width: 1.w,
                            )
                          : null,
                    ),
                    child: Container(
                      height: Sizes.s32.r,
                      width: Sizes.s32.r,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(
                              alpha: isSelected ? 0.35 : 0.15,
                            ),
                            blurRadius: isSelected ? 10 : 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: isSelected ? 1.0 : 0.0,
                          child: Icon(
                            Icons.check_rounded,
                            color: isLight
                                ? ColorManager.black
                                : ColorManager.white,
                            size: Sizes.s18.r,
                          ),
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
