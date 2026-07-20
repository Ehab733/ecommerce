import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;
  const CategoryItem({super.key, required this._category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.s100.w + Sizes.s40.w * 2, // ارتفاع كافٍ لصفين مع النصوص
      child: Column(
        children: [
          // الدائرة
          Container(
            height: Sizes.s100.h - Sizes.s20.h,
            width: Sizes.s100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey, // ضع هنا NetworkImage أو AssetImage
              image: DecorationImage(
                image: NetworkImage(_category.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: Sizes.s8.h),
          // النص
          Text(
            _category.name,
            textAlign: TextAlign.center,
            style: getBoldStyle(
              color: ColorManager.primary,
              fontsize: FontSize.s14,
            ),
          ),
        ],
      ),
    );
  }
}
