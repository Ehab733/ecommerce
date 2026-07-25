import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSearch(BuildContext context) => Row(
  children: [
    Expanded(
      child: TextFormFieldEdit(
        controller: TextEditingController(),
        label: 'what do you search for ?',
        icon: Icon(
          Icons.search,
          size: Sizes.s24.r,
          color: ColorManager.primary,
        ),
        prefixIcon: true,
        keyboardType: TextInputType.text,
        radius: 25.r,
      ),
    ),
    SizedBox(width: 10.w),
    IconButton(
      icon: Icon(
        Icons.shopping_cart_outlined,
        size: Sizes.s28,
        color: ColorManager.primary,
      ),
      onPressed: () => Navigator.pushNamed(context, Routes.cart),
    ),
  ],
);
