import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
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
    // ✅ تهيئة مباشرة ومضمونة في initState بدون PostFrameCallback
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
      // ✅ توفير الـ Cubit للشاشة بآمان
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                // 📌 1. العنوان والوصف
                Text(
                  "Enter OTP\nCode",
                  style: getBoldStyle(
                    color: Colors.black,
                    fontsize: 32.sp,
                  ).copyWith(height: 1.15),
                ),
                SizedBox(height: 12.h),
                Text(
                  "We have sent the code verification to\n${widget.email}",
                  style: getRegularStyle(
                    color: const Color(0xFF676767),
                    fontsize: 13.sp,
                  ).copyWith(height: 1.4),
                ),

                SizedBox(height: 36.h),

                // 🔢 2. مربعات إدخال الـ OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    widget.codeLength,
                    (index) => SizedBox(
                      width:
                          (MediaQuery.of(context).size.width -
                              48.w -
                              ((widget.codeLength - 1) * 8.w)) /
                          widget.codeLength,
                      height: 60.h,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                          color: Colors.black,
                          fontsize: widget.codeLength > 4 ? 18.sp : 22.sp,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF3F3F3),
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFFF3B5C),
                              width: 1.5,
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

                SizedBox(height: 32.h),

                // 🔘 3. زر التأكيد مع الاستماع للحالة (BlocConsumer)
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loading: () => EasyLoading.show(
                          status: 'Verifying...',
                          dismissOnTap: false,
                          maskType: EasyLoadingMaskType.black,
                          options: EasyLoadingOptions(userInteractions: false),
                        ),
                        success: () {
                          EasyLoading.dismiss();
                          context.push(
                            Routes.addNewPassword,
                            extra: widget.email,
                          );
                        },
                        error: (message) {
                          EasyLoading.dismiss();
                          UiUtils.showMessage(context, message, isError: true);
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
                          backgroundColor: const Color(0xFFFF3B5C),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          "Verify",
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontsize: 16.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 24.h),

                // 🔄 4. إعادة إرسال الكود
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive code? ",
                      style: getRegularStyle(
                        color: const Color(0xFF676767),
                        fontsize: 13.sp,
                      ),
                    ),
                    Builder(
                      builder: (btnContext) {
                        return GestureDetector(
                          onTap: () {
                            // ✅ استخدام btnContext لضمان الوصول للـ Cubit
                            btnContext
                                .read<ForgetPasswordCubit>()
                                .forgetPassword(widget.email);
                          },
                          child: Text(
                            "Resend",
                            style: getBoldStyle(
                              color: const Color(0xFFFF3B5C),
                              fontsize: 13.sp,
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
    );
  }
}
