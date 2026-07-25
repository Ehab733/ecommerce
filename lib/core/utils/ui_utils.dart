import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {
  static void showLoading(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: ColorManager.transparent,

        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingIndicator()],
          ),
        ),
      ),
    ),
  );

  static void hideLoading(BuildContext context) => Navigator.pop(context);

  static void showMessage(
    BuildContext context,
    String message, {
    bool isError = true,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: getRegularStyle(color: ColorManager.white),
        ),
        backgroundColor: isError ? ColorManager.error : ColorManager.primary,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.r),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
