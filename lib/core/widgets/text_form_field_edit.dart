import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldEdit extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final int? maxLength;
  const TextFormFieldEdit({
    super.key,
    this.isPassword = false,
    this.maxLength,
    required this.controller,
    this.keyboardType,
    required this.label,
    this.validator,
  });

  @override
  State<TextFormFieldEdit> createState() => _TextFormFieldEditState();
}

class _TextFormFieldEditState extends State<TextFormFieldEdit> {
  late bool hidePassword = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        fillColor: ColorManager.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.s14.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.s14.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.s14.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.s14.sp),
        ),
        hintText: widget.label,
        hintStyle: getLightStyle(
          color: ColorManager.grey,
          fontsize: FontSize.s18.sp,
        ),
        errorStyle: getLightStyle(
          color: ColorManager.error,
          fontsize: FontSize.s16,
        ),
        suffixIcon: widget.isPassword
            ? hidePassword
                  ? IconButton(
                      onPressed: () {
                        hidePassword = false;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_sharp,
                        color: ColorManager.grey2,
                        size: Sizes.s24.sp,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        hidePassword = true;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_off_sharp,
                        color: ColorManager.grey2,
                        size: Sizes.s24.sp,
                      ),
                    )
            : null,
      ),
      obscureText: hidePassword,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
    );
  }
}
