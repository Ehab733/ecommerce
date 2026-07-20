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
  final bool prefixIcon;
  final Icon? icon;
  final double? radius;
  const TextFormFieldEdit({
    super.key,
    this.isPassword = false,
    this.maxLength,
    this.prefixIcon = false,
    required this.controller,
    this.keyboardType,
    required this.label,
    this.validator,
    this.icon,
    this.radius,
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
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.sp),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.sp),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.sp),
          borderSide: BorderSide(color: ColorManager.primary),
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
        prefixIcon: widget.prefixIcon ? widget.icon : null,
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
