import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = getRegularStyle(
      color: ColorManager.grey,
      fontsize: FontSize.s13.sp,
    ).copyWith(height: 1.5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: getBoldStyle(
            color: ColorManager.textPrimary,
            fontsize: FontSize.s16.sp,
          ),
        ),
        SizedBox(height: Insets.s8.h),

        // 🔄 تحول سلس وفوري بين النص المختصر والكامل مع تباين مريح للعين
        AnimatedCrossFade(
          firstChild: Text(
            widget.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
          secondChild: Text(widget.description, style: textStyle),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),

        // 👆 زر التوسيع / الإغلاق العصري
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Padding(
            padding: EdgeInsets.only(top: Insets.s6.h, bottom: Insets.s2.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isExpanded ? 'Read Less' : 'Read More',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontsize: FontSize.s12.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: ColorManager.primary,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
