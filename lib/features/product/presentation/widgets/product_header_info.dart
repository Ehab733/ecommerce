import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1️⃣ اسم المنتج مع معالجة النصوص الطويلة لمنع الـ Overflow
        Expanded(
          child: Text(
            title,
            style: getMediumStyle(
              color: ColorManager.text,
              fontsize: FontSize.s18,
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // 2️⃣ السعر
        Visibility(
          visible: priceAfterDiscount == null,
          child: Text(
            "EGP ${priceAfterDiscount.toString()}",
            style: getMediumStyle(
              color: ColorManager.text,
              fontsize: FontSize.s18,
            ),
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          "EGP ${price.toString()}",
          style: priceAfterDiscount != null
              ? getMediumStyle(color: ColorManager.text, fontsize: FontSize.s18)
              : getTextWithLine(),
        ),
      ],
    );
  }
}
