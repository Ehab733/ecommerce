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

class CreateNewPasswordScreen extends StatefulWidget {
  final String email;
  const CreateNewPasswordScreen({super.key, required this.email});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            // 🎨 1. خلفية متدرجة مع توهج علوي فاخر
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

                        // 📌 1. العنوان والوصف مع أيقونة معبرة
                        Row(
                          children: [
                            Text(
                              "Create new\npassword",
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
                                Icons.lock_reset_rounded,
                                color: ColorManager.primary,
                                size: 28.sp,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Sizes.s12.h),

                        Text(
                          "Your new password must be unique from those previously used.",
                          style: getRegularStyle(
                            color: ColorManager.textSecondary,
                            fontsize: FontSize.s13.sp,
                          ).copyWith(height: 1.4),
                        ),

                        SizedBox(height: Sizes.s32.h),

                        // 🔑 2. حقل كلمة المرور الجديدة
                        TextFormFieldEdit(
                          controller: _passwordController,
                          isPassword: true,
                          label: 'New Password',
                          icon: Icon(
                            Icons.lock_outline_rounded,
                            color: ColorManager.textSecondary,
                            size: 20.sp,
                          ),
                          prefixIcon: true,
                          textColor: ColorManager.black,
                          validator: (val) => Validator.validatePassword(val),
                        ),

                        SizedBox(height: Sizes.s18.h),

                        // 🔑 3. حقل تأكيد كلمة المرور
                        TextFormFieldEdit(
                          controller: _confirmPasswordController,
                          isPassword: true,
                          label: 'Confirm Password',
                          icon: Icon(
                            Icons.lock_outline_rounded,
                            color: ColorManager.textSecondary,
                            size: 20.sp,
                          ),
                          prefixIcon: true,
                          textColor: ColorManager.black,
                          validator: (val) => Validator.validateConfirmPassword(
                            val,
                            _passwordController.text,
                          ),
                        ),

                        SizedBox(height: Sizes.s32.h),

                        // 🔘 4. زر إعادة التعيين بالتوهج الفاخر
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
                                      status: 'Updating...',
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
                                          'Password reset successfully.',
                                          isError: false,
                                        );
                                        context.go(Routes.login);
                                      }
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  return ElevatedButtonEdit(
                                    title: 'Reset Password',
                                    backgroundColor: ColorManager.primary,
                                    textColor: ColorManager.white,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ForgetPasswordCubit>()
                                            .resetPassword(
                                              widget.email,
                                              _passwordController.text.trim(),
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
