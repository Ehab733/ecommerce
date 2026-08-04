import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHeaderInfo extends StatelessWidget {
  final String title;
  final String price;
  final String? priceAfterDiscount;

  const ProductHeaderInfo({
    super.key,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1️⃣ اسم المنتج مع معالجة النصوص الطويلة لمنع الـ Overflow
        Text(
          title,
          style: getMediumStyle(
            color: ColorManager.text,
            fontsize: FontSize.s18,
          ),
        ),
        SizedBox(height: Sizes.s18.w),

        // 2️⃣ السعر
        Row(
          children: [
            Visibility(
              visible: priceAfterDiscount != null,
              child: Text(
                "EGP ${priceAfterDiscount.toString()}",
                style: getMediumStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s18,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            Text(
              "EGP ${price.toString()}",
              style: priceAfterDiscount == null
                  ? getMediumStyle(
                      color: ColorManager.primary,
                      fontsize: FontSize.s18,
                    )
                  : getTextWithLine(color: ColorManager.text),
            ),
          ],
        ),
      ],
    );
  }
}
