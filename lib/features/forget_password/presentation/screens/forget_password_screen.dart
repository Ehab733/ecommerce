import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/forget_password/presentation/manager/cubit/forget_password_cubit.dart';
import 'package:ecommerce/features/forget_password/presentation/manager/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF9FF),
        body: Stack(
          children: [
            // 🎨 1. خلفية متدرجة بلمسة ناعمة وتوهج زجاجي أعلى الشاشة
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
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Sizes.s16.h),

                        // 0️⃣ زر العودة للخلف بتصميم زجاجي أنيق
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

                        // 📌 1. العنوان والأيقونة
                        Row(
                          children: [
                            Text(
                              "Forgot\npassword?",
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
                                Icons.mark_email_read_outlined,
                                color: ColorManager.primary,
                                size: 28.sp,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Sizes.s32.h),

                        // ✉️ 2. حقل إدخال البريد الإلكتروني
                        TextFormFieldEdit(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Enter your email address',
                          icon: Icon(
                            Icons.email_outlined,
                            color: ColorManager.textSecondary,
                            size: 20.sp,
                          ),
                          prefixIcon: true,
                          textColor: ColorManager.black,
                          validator: (val) => Validator.validateEmail(val),
                        ),

                        SizedBox(height: Sizes.s12.h),

                        // 📝 3. التوضيح السفلي
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s4.w,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "* ",
                                  style: getBoldStyle(
                                    color: ColorManager.primary,
                                    fontsize: FontSize.s12.sp,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "We will send you a message to set or reset your new password",
                                  style: getRegularStyle(
                                    color: ColorManager.textSecondary,
                                    fontsize: FontSize.s12.sp,
                                  ).copyWith(height: 1.3),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: Sizes.s32.h),

                        // 🔘 4. زر الإرسال بالتوهج الفاخر
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
                                      status: 'Sending...',
                                      dismissOnTap: false,
                                      maskType: EasyLoadingMaskType.black,
                                    ),
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
                                    success: () async {
                                      await EasyLoading.dismiss();
                                      if (context.mounted) {
                                        UiUtils.showMessage(
                                          context,
                                          'A reset code has been sent to your email.',
                                          isError: false,
                                        );
                                        context.push(
                                          Routes.verifyCodeResetPassword,
                                          extra: _emailController.text.trim(),
                                        );
                                      }
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  return ElevatedButtonEdit(
                                    title: 'Send Code',
                                    backgroundColor: ColorManager.primary,
                                    textColor: ColorManager.white,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ForgetPasswordCubit>()
                                            .forgetPassword(
                                              _emailController.text.trim(),
                                            );
                                      }
                                    },
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
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
