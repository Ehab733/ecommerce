import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonEdit extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isLoading;
  final double? borderRadius;

  const ElevatedButtonEdit({
    super.key,
    required this.title,
    this.onPressed,
    this.height,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.isLoading = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? ColorManager.white;
    final effectiveTextColor = textColor ?? ColorManager.primary;
    final effectiveRadius = borderRadius?.r ?? Sizes.s16.r;
    final isEnabled = onPressed != null && !isLoading;

    return Container(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(effectiveRadius),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: effectiveBackgroundColor == ColorManager.white
                      ? ColorManager.black.withValues(alpha: 0.06)
                      : effectiveBackgroundColor.withValues(alpha: 0.3),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          disabledBackgroundColor: effectiveBackgroundColor.withValues(
            alpha: 0.6,
          ),
          elevation: 0,
          overlayColor: effectiveTextColor.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1.2.w)
                : BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(horizontal: Insets.s16.w),
        ),
        onPressed: isLoading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isLoading
              ? SizedBox(
                  key: const ValueKey('loading_indicator'),
                  width: 22.r,
                  height: 22.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: effectiveTextColor,
                  ),
                )
              : Text(
                  title,
                  key: const ValueKey('button_title'),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(
                    color: isEnabled
                        ? effectiveTextColor
                        : effectiveTextColor.withValues(alpha: 0.6),
                    fontsize: FontSize.s16.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
