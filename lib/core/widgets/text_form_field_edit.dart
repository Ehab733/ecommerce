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

  // 💡 إضافة بروب جديدة لتحديد ما إذا كانت الشاشة ذات خلفية داكنة أو بيضاء
  final bool isDarkBackground;
  final Color? textColor;
  final Color? borderColor;

  const TextFormFieldEdit({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.maxLength,
    this.prefixIcon = false,
    this.keyboardType,
    this.validator,
    this.icon,
    this.radius,
    this.isDarkBackground = false, // 👈 القيمة الافتراضية خلفية بيضاء
    this.textColor,
    this.borderColor,
  });

  @override
  State<TextFormFieldEdit> createState() => _TextFormFieldEditState();
}

class _TextFormFieldEditState extends State<TextFormFieldEdit> {
  late bool hidePassword = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    // 🎨 تحديد ألوان العناصر حسب نوع الخلفية (داكنة أم فاتحة)
    final effectiveTextColor =
        widget.textColor ??
        (widget.isDarkBackground ? ColorManager.white : ColorManager.primary);

    final effectiveBorderColor =
        widget.borderColor ??
        (widget.isDarkBackground
            ? ColorManager.white.withAlpha(100)
            : ColorManager.primary.withAlpha(80));

    final effectiveFocusedBorderColor = widget.isDarkBackground
        ? ColorManager.white
        : ColorManager.primary;

    final effectiveLabelColor = widget.isDarkBackground
        ? ColorManager.white.withAlpha(170)
        : ColorManager.grey;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: hidePassword,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,

      // ✍️ لون ونمط النص المدخل
      style: getMediumStyle(
        color: effectiveTextColor,
        fontsize: FontSize.s15.sp,
      ),

      decoration: InputDecoration(
        counterText: "",
        filled: false,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Insets.s16.w,
          vertical: Insets.s16.h,
        ),

        // 💫 الـ Label وتنسيقه
        labelText: widget.label,
        labelStyle: getLightStyle(
          color: effectiveLabelColor,
          fontsize: FontSize.s15.sp,
        ),
        floatingLabelStyle: getMediumStyle(
          color: effectiveFocusedBorderColor,
          fontsize: FontSize.s14.sp,
        ),

        // 1️⃣ الحدود في الحالة العادية
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.r),
          borderSide: BorderSide(color: effectiveBorderColor, width: 1.2),
        ),

        // 2️⃣ الحدود عند الكتابة والتركيز (Focus)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.r),
          borderSide: BorderSide(
            color: effectiveFocusedBorderColor,
            width: 1.8,
          ),
        ),

        // 3️⃣ الحدود عند الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.r),
          borderSide: BorderSide(color: ColorManager.error, width: 1.2),
        ),

        // 4️⃣ الحدود عند التركيز مع وجود خطأ
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? Insets.s14.r),
          borderSide: BorderSide(color: ColorManager.error, width: 1.8),
        ),

        errorStyle: getMediumStyle(
          color: ColorManager.error,
          fontsize: FontSize.s12.sp,
        ),

        prefixIcon: widget.prefixIcon ? widget.icon : null,

        // 👁️ أنيميشن إظهار/إخفاء كلمة المرور
        suffixIcon: widget.isPassword
            ? AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: Tween<double>(
                      begin: 0.75,
                      end: 1.0,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: hidePassword
                    ? IconButton(
                        key: const ValueKey('icon1'),
                        onPressed: () {
                          setState(() => hidePassword = false);
                        },
                        icon: Icon(
                          Icons.visibility_sharp,
                          color: effectiveFocusedBorderColor,
                          size: Sizes.s20.sp,
                        ),
                      )
                    : IconButton(
                        key: const ValueKey('icon2'),
                        onPressed: () {
                          setState(() => hidePassword = true);
                        },
                        icon: Icon(
                          Icons.visibility_off_sharp,
                          color: effectiveFocusedBorderColor,
                          size: Sizes.s20.sp,
                        ),
                      ),
              )
            : null,
      ),
    );
  }
}
