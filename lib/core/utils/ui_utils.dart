import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {
  static bool _isLoadingShowing = false;

  /// ⏳ عرض نافذة التحميل (Loading Dialog)
  static void showLoading(BuildContext context) {
    if (_isLoadingShowing) return;

    _isLoadingShowing = true;

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      transitionDuration: const Duration(milliseconds: 250),
      useRootNavigator: true,
      pageBuilder: (_, _, _) {
        return PopScope(
          canPop: false,
          child: Center(
            child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(Insets.s24.r),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(Sizes.s16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [LoadingIndicator()],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    ).then((_) {
      _isLoadingShowing = false;
    });
  }

  /// ❌ إغلاق نافذة التحميل
  static void hideLoading(BuildContext context) {
    if (_isLoadingShowing && context.mounted) {
      _isLoadingShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  /// 🔔 عرض رسالة تنبيه أو خطأ (SnackBar)
  static void showMessage(
    BuildContext context,
    String message, {
    bool isError = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (!context.mounted) return;

    // إغلاق لوحة المفاتيح
    FocusScope.of(context).unfocus();

    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.only(
          left: Insets.s16.w,
          right: Insets.s16.w,
          bottom: Insets.s20.h,
        ),
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection.horizontal,
        content: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s14.w,
            vertical: Insets.s10.h,
          ),
          decoration: BoxDecoration(
            color: isError ? ColorManager.error : ColorManager.darkPrimary,
            borderRadius: BorderRadius.circular(Sizes.s12.r),
            boxShadow: [
              BoxShadow(
                color: (isError ? ColorManager.error : ColorManager.darkPrimary)
                    .withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(Insets.s6.r),
                decoration: BoxDecoration(
                  color: ColorManager.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isError
                      ? Icons.error_outline_rounded
                      : Icons.check_circle_outline_rounded,
                  color: ColorManager.white,
                  size: Sizes.s20.sp,
                ),
              ),
              SizedBox(width: Sizes.s12.w),
              Expanded(
                child: Text(
                  message,
                  style: getMediumStyle(
                    color: ColorManager.white,
                    fontsize: FontSize.s12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: Sizes.s8.w),
              GestureDetector(
                onTap: () => messenger.hideCurrentSnackBar(),
                child: Icon(
                  Icons.close_rounded,
                  color: ColorManager.white.withValues(alpha: 0.8),
                  size: Sizes.s18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
