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
  final Widget? icon;
  final double? radius;
  final bool isDarkBackground;
  final Color? textColor;
  final Color? borderColor;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;

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
    this.isDarkBackground = false,
    this.textColor,
    this.borderColor,
    this.onChanged,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<TextFormFieldEdit> createState() => _TextFormFieldEditState();
}

class _TextFormFieldEditState extends State<TextFormFieldEdit> {
  late bool _hidePassword;

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.isPassword;
  }

  @override
  void didUpdateWidget(covariant TextFormFieldEdit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPassword != widget.isPassword) {
      _hidePassword = widget.isPassword;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 تحديد ألوان العناصر بحسب الخلفية
    final effectiveTextColor =
        widget.textColor ??
        (widget.isDarkBackground
            ? ColorManager.white
            : ColorManager.textPrimary);

    final effectiveFillColor = widget.isDarkBackground
        ? ColorManager.white.withValues(alpha: 0.08)
        : ColorManager.primary.withValues(alpha: 0.03);

    final effectiveBorderColor =
        widget.borderColor ??
        (widget.isDarkBackground
            ? ColorManager.white.withValues(alpha: 0.2)
            : ColorManager.primary.withValues(alpha: 0.12));

    final effectiveFocusedBorderColor = widget.isDarkBackground
        ? ColorManager.white
        : ColorManager.primary;

    final effectiveLabelColor = widget.isDarkBackground
        ? ColorManager.white.withValues(alpha: 0.6)
        : ColorManager.grey;

    final effectiveRadius = widget.radius?.r ?? Sizes.s16.r;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _hidePassword,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      style: getMediumStyle(
        color: effectiveTextColor,
        fontsize: FontSize.s14.sp,
      ),
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: effectiveFillColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Insets.s16.w,
          vertical: Insets.s14.h,
        ),
        labelText: widget.label,
        labelStyle: getRegularStyle(
          color: effectiveLabelColor,
          fontsize: FontSize.s14.sp,
        ),
        floatingLabelStyle: getBoldStyle(
          color: effectiveFocusedBorderColor,
          fontsize: FontSize.s13.sp,
        ),

        // 1️⃣ الحدود العادية (Default Enabled)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
          borderSide: BorderSide(color: effectiveBorderColor, width: 1.w),
        ),

        // 2️⃣ الحدود عند التركيز (Focus State)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
          borderSide: BorderSide(
            color: effectiveFocusedBorderColor,
            width: 1.5.w,
          ),
        ),

        // 3️⃣ الحدود عند الخطأ (Error State)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
          borderSide: BorderSide(
            color: ColorManager.error.withValues(alpha: 0.6),
            width: 1.w,
          ),
        ),

        // 4️⃣ الحدود عند التركيز والخطأ
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
          borderSide: BorderSide(color: ColorManager.error, width: 1.5.w),
        ),

        errorStyle: getMediumStyle(
          color: ColorManager.error,
          fontsize: FontSize.s11.sp,
        ),

        // 🔍 الأيقونة الأمامية
        prefixIcon: widget.prefixIcon && widget.icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.s12.w),
                child: IconTheme(
                  data: IconThemeData(
                    color: effectiveFocusedBorderColor.withValues(alpha: 0.8),
                    size: 20.sp,
                  ),
                  child: widget.icon!,
                ),
              )
            : null,

        // 👁️ أنيميشن إظهار/إخفاء كلمة المرور
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.only(right: Insets.s4.w),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: IconButton(
                    key: ValueKey<bool>(_hidePassword),
                    onPressed: () {
                      setState(() => _hidePassword = !_hidePassword);
                    },
                    icon: Icon(
                      _hidePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: effectiveFocusedBorderColor.withValues(alpha: 0.7),
                      size: 20.sp,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
