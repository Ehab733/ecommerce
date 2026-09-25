import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatefulWidget {
  final Category _category;

  const CategoryItem({super.key, required category}) : _category = category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        context.push(Routes.products, extra: widget._category);
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.s2.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1️⃣ إطار الصورة العصري بنمط Squircle متدرج وفاخر
              Container(
                height: 76.h,
                width: 76.w,
                padding: EdgeInsets.all(Insets.s2.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.primary.withValues(alpha: 0.35),
                      ColorManager.primary.withValues(alpha: 0.04),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.s20.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.1),
                      blurRadius: 14,
                      spreadRadius: 1,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(Sizes.s20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.s20.r),
                    child: Image.network(
                      widget._category.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: ColorManager.primary.withValues(alpha: 0.05),
                        child: Icon(
                          Icons.category_rounded,
                          color: ColorManager.primary,
                          size: 26.sp,
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: ColorManager.lightGrey.withValues(alpha: 0.2),
                          child: Center(
                            child: SizedBox(
                              width: Sizes.s16.w,
                              height: Sizes.s16.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.w,
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: Sizes.s8.h),

              // 2️⃣ اسم التصنيف الأنيق
              SizedBox(
                width: 82.w,
                child: Text(
                  widget._category.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
