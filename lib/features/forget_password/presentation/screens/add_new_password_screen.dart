import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
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
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ✅ توفير الـ Cubit للشاشة لمنع ProviderNotFoundException
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // 📌 1. العنوان والوصف
                  Text(
                    "Create new\npassword",
                    style: getBoldStyle(
                      color: Colors.black,
                      fontsize: 32.sp,
                    ).copyWith(height: 1.15),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Your new password must be unique from those previously used.",
                    style: getRegularStyle(
                      color: const Color(0xFF676767),
                      fontsize: 13.sp,
                    ).copyWith(height: 1.4),
                  ),

                  SizedBox(height: 32.h),

                  // 🔑 2. حقل كلمة المرور الجديدة
                  TextFormFieldEdit(
                    controller: _passwordController,
                    isPassword: true,
                    label: 'New Password',
                    icon: const Icon(Icons.lock_outline_rounded),
                    prefixIcon: true,
                    textColor: ColorManager.black,
                    validator: (val) => Validator.validatePassword(val),
                  ),

                  SizedBox(height: 16.h),

                  // 🔑 3. حقل تأكيد كلمة المرور
                  TextFormFieldEdit(
                    controller: _confirmPasswordController,
                    isPassword: true,
                    label: 'Confirm Password',
                    icon: const Icon(Icons.lock_outline_rounded),
                    prefixIcon: true,
                    textColor: ColorManager.black,
                    validator: (val) => Validator.validateConfirmPassword(
                      val,
                      _passwordController.text,
                    ),
                  ),

                  SizedBox(height: 36.h),

                  // 🔘 4. زر إعادة التعيين
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child:
                        BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              loading: () => EasyLoading.show(
                                dismissOnTap: false,
                                maskType: EasyLoadingMaskType.black,
                              ),
                              error: (message) {
                                EasyLoading.dismiss();
                                UiUtils.showMessage(
                                  context,
                                  message,
                                  isError: true,
                                );
                              },
                              success: () {
                                EasyLoading.dismiss();
                                UiUtils.showMessage(
                                  context,
                                  'Password reset successfully.',
                                  isError: false,
                                );
                                context.go(Routes.login);
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
    );
  }
}
