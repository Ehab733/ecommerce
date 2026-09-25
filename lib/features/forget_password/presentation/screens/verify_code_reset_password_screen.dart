import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/features/forget_password/presentation/manager/cubit/forget_password_cubit.dart';
import 'package:ecommerce/features/forget_password/presentation/manager/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  final int codeLength;

  const VerificationScreen({
    super.key,
    required this.email,
    this.codeLength = 6,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.codeLength,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF9FF),
        body: Stack(
          children: [
            // 🎨 1. توهج خلفية ناعم وفاخر
            Positioned(
              top: -100.h,
              right: -60.w,
              child: Container(
                width: 260.w,
                height: 260.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary.withValues(alpha: 0.08),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.12),
                      blurRadius: 80,
                      spreadRadius: 20,
                    ),
                  ],
                ),
              ),
            ),

            // 2. المحتوى الرئيسي
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.s24.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Sizes.s16.h),

                      // 0️⃣ زر العودة للخلف بتصميم زجاجي
                      InkWell(
                        onTap: () => context.pop(),
                        borderRadius: BorderRadius.circular(Sizes.s12.r),
                        child: Container(
                          padding: EdgeInsets.all(Insets.s8.r),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(Sizes.s12.r),
                            border: Border.all(
                              color: ColorManager.lightGrey.withValues(
                                alpha: 0.4,
                              ),
                              width: 1.w,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: ColorManager.textPrimary,
                            size: 18.sp,
                          ),
                        ),
                      ),

                      SizedBox(height: Sizes.s28.h),

                      // 📌 1. العنوان والوصف مع أيقونة الـ OTP
                      Row(
                        children: [
                          Text(
                            "Enter OTP\nCode",
                            style: getBoldStyle(
                              color: ColorManager.textPrimary,
                              fontsize: FontSize.s32.sp,
                            ).copyWith(height: 1.15, letterSpacing: -0.5),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(Insets.s12.r),
                            decoration: BoxDecoration(
                              color: ColorManager.primary.withValues(
                                alpha: 0.08,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.verified_user_outlined,
                              color: ColorManager.primary,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Sizes.s12.h),

                      Text(
                        "We have sent the verification code to\n${widget.email}",
                        style: getRegularStyle(
                          color: ColorManager.textSecondary,
                          fontsize: FontSize.s13.sp,
                        ).copyWith(height: 1.4),
                      ),

                      SizedBox(height: Sizes.s32.h),

                      // 🔢 2. مربعات إدخال الـ OTP العصرية
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          widget.codeLength,
                          (index) => SizedBox(
                            width:
                                (MediaQuery.of(context).size.width -
                                    (Insets.s24.w * 2) -
                                    ((widget.codeLength - 1) * Sizes.s12.w)) /
                                widget.codeLength,
                            height: 60.h,
                            child: TextFormField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                color: ColorManager.textPrimary,
                                fontsize: widget.codeLength > 4
                                    ? FontSize.s20.sp
                                    : FontSize.s24.sp,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorManager.white,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s14.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: ColorManager.lightGrey.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s14.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: ColorManager.lightGrey.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s14.r,
                                  ),
                                  borderSide: const BorderSide(
                                    color: ColorManager.primary,
                                    width: 1.8,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty &&
                                    index < widget.codeLength - 1) {
                                  _focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Sizes.s32.h),

                      // 🔘 3. زر التأكيد بالتوهج الفاخر
                      Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.s14.r),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.primary.withValues(
                                alpha: 0.28,
                              ),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child:
                            BlocConsumer<
                              ForgetPasswordCubit,
                              ForgetPasswordState
                            >(
                              listener: (context, state) {
                                state.whenOrNull(
                                  loading: () => EasyLoading.show(
                                    status: 'Verifying...',
                                    dismissOnTap: false,
                                    maskType: EasyLoadingMaskType.black,
                                  ),
                                  success: () async {
                                    await EasyLoading.dismiss();
                                    if (context.mounted) {
                                      context.push(
                                        Routes.addNewPassword,
                                        extra: widget.email,
                                      );
                                    }
                                  },
                                  error: (message) async {
                                    await EasyLoading.dismiss();
                                    if (context.mounted) {
                                      UiUtils.showMessage(
                                        context,
                                        message,
                                        isError: true,
                                      );
                                    }
                                  },
                                );
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (_otpCode.length == widget.codeLength) {
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .codeVerification(_otpCode);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.s14.r,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Verify",
                                    style: getBoldStyle(
                                      color: ColorManager.white,
                                      fontsize: FontSize.s16.sp,
                                    ),
                                  ),
                                );
                              },
                            ),
                      ),

                      SizedBox(height: Sizes.s28.h),

                      // 🔄 4. إعادة إرسال الكود
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive code? ",
                            style: getRegularStyle(
                              color: ColorManager.textSecondary,
                              fontsize: FontSize.s13.sp,
                            ),
                          ),
                          Builder(
                            builder: (btnContext) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(Sizes.s8.r),
                                onTap: () {
                                  btnContext
                                      .read<ForgetPasswordCubit>()
                                      .forgetPassword(widget.email);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Insets.s4.w,
                                    vertical: Insets.s2.h,
                                  ),
                                  child: Text(
                                    "Resend",
                                    style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontsize: FontSize.s13.sp,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
