import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final String totalPrice;
  final String title;
  final IconData? iconLeading;
  final IconData? iconTrailing;
  final VoidCallback onClicked;

  const BottomBar({
    super.key,
    required this.totalPrice,
    required this.onClicked,
    this.iconLeading,
    this.iconTrailing,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

      child: SafeArea(
        child: Row(
          children: [
            // السعر الإجمالي
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                  style: getMediumStyle(
                    color: ColorManager.primaryDark.withAlpha(160),
                    fontsize: FontSize.s18,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  totalPrice,
                  style: getMediumStyle(
                    color: ColorManager.text,
                    fontsize: FontSize.s18,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24.w),

            // زر Check Out
            Expanded(
              child: ElevatedButton(
                onPressed: onClicked,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: iconLeading != null,
                      child: Icon(
                        iconLeading,
                        color: ColorManager.white,
                        size: 20.r,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      title,
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontsize: FontSize.s20,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Visibility(
                      visible: iconTrailing != null,
                      child: Icon(
                        iconTrailing,
                        color: ColorManager.white,
                        size: 20.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
