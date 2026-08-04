import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {
  static void showLoading(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4), // خلفية مظللة بنسبة هادئة
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, _, _) {
        return PopScope(
          canPop: false, // منع الإغلاق بزر الرجوع
          child: Center(
            child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // أبعاد صريحة تناسب الكارت فقط
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const LoadingIndicator()],
                ),
              ),
            ),
          ),
        );
      },
      // 💫 تأثير Zoom In + Fade in
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void showMessage(
    BuildContext context,
    String message, {
    bool isError = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    // إغلاق لوحة المفاتيح
    FocusScope.of(context).unfocus();

    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent, // شفاف لتمرير الـ Container
        elevation: 0,
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection
            .horizontal, // 👈 سحب الرسالة يميناً أو يساراً لإغلاقها
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isError ? ColorManager.error : ColorManager.darkPrimary,
            borderRadius: BorderRadius.circular(12.r),
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
              // 🔔 الأيقونة حسب نوع الرسالة
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: ColorManager.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isError
                      ? Icons.error_outline_rounded
                      : Icons.check_circle_outline_rounded,
                  color: ColorManager.white,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),

              // 📝 نص الرسالة
              Expanded(
                child: Text(
                  message,
                  style: getMediumStyle(
                    // 👈 استخدام Medium بدلاً من Regular ليكون أوضح للقراءة
                    color: ColorManager.white,
                    fontsize: 12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // ✖️ زر إغلاق سريع (أناقة وسلاسة في الاستخدام)
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => messenger.hideCurrentSnackBar(),
                child: Icon(
                  Icons.close_rounded,
                  color: ColorManager.white.withValues(alpha: 0.8),
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
