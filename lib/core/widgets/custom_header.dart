import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget customHeader({
  BuildContext? context,
  List<Widget>? actions,
  bool leading = true,
  String title = 'Stylish',
  double height = kToolbarHeight,
  VoidCallback? onMenuPressed,
  VoidCallback? onProfilePressed,
  String? profileImageUrl = 'https://i.pravatar.cc/150?img=47',
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height.h),
    child: Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border(
          bottom: BorderSide(
            color: ColorManager.primary.withValues(alpha: 0.06),
            width: 1.w,
          ),
        ),
      ),
      child: AppBar(
        toolbarHeight: height.h,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,

        // 1️⃣ أداة العودة / القائمة الجانبية بتصميم عصري
        leading: leading
            ? Padding(
                padding: EdgeInsets.only(left: Insets.s12.w),
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (onMenuPressed != null) {
                          onMenuPressed();
                        } else if (context != null && context.canPop()) {
                          context.pop();
                        }
                      },
                      borderRadius: BorderRadius.circular(Sizes.s12.r),
                      child: Container(
                        width: 38.r,
                        height: 38.r,
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(Sizes.s12.r),
                        ),
                        child: Icon(
                          (context != null && context.canPop())
                              ? Icons.arrow_back_ios_new_rounded
                              : Icons.notes_rounded,
                          color: ColorManager.textPrimary,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,

        // 2️⃣ الشعار باسم التطبيق مع لمسة تدرج
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.r,
              height: 32.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [ColorManager.primary, ColorManager.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.all_inclusive_rounded,
                  color: ColorManager.white,
                  size: 18.sp,
                ),
              ),
            ),
            SizedBox(width: Sizes.s8.w),
            Text(
              title,
              style: getBoldStyle(
                color: ColorManager.textPrimary,
                fontsize: FontSize.s18.sp,
              ),
            ),
          ],
        ),

        // 3️⃣ الصورة الشخصية مع إطار وحاوية تفاعلية
        actions:
            actions ??
            [
              Padding(
                padding: EdgeInsets.only(right: Insets.s12.w),
                child: Center(
                  child: GestureDetector(
                    onTap: onProfilePressed,
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorManager.primary.withValues(alpha: 0.2),
                          width: 1.5.w,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: ColorManager.primary.withValues(
                          alpha: 0.08,
                        ),
                        backgroundImage: profileImageUrl != null
                            ? NetworkImage(profileImageUrl)
                            : null,
                        onBackgroundImageError: (_, _) {},
                        child: profileImageUrl == null
                            ? Icon(
                                Icons.person_outline_rounded,
                                color: ColorManager.primary,
                                size: 18.sp,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ],
      ),
    ),
  );
}
