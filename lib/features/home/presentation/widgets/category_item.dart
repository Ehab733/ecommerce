import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;
  const CategoryItem({super.key, required this._category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.products, extra: _category);
        Logger().d(_category);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. الدائرة المحسنة مع إطار وظل جذاب
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.white,
              border: Border.all(
                color: ColorManager.primary.withAlpha(50),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.black.withAlpha(25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                _category.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.category_outlined,
                  color: ColorManager.primary,
                  size: 32.sp,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: SizedBox(
                      width: Sizes.s20.w,
                      height: Sizes.s20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: Sizes.s4.h),

          // 2. اسم التصنيف بتنسيق نظيف لمنع حدوث قطع أو Overflow
          SizedBox(
            width: 85.w,
            child: Text(
              _category.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.primary,
                fontsize: FontSize.s12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
