import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
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
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ✅ إنشاء الـ Cubit مباشرة بأمان وبدون late أو PostFrameCallback
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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

                  // 📌 العنوان
                  Text(
                    "Forgot\npassword?",
                    style: TextStyle(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.15,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // ✉️ حقل إدخال الإيميل
                  TextFormFieldEdit(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Enter your email address',
                    icon: const Icon(Icons.email_outlined),
                    prefixIcon: true,
                    textColor: ColorManager.black,
                    validator: (val) => Validator.validateEmail(val),
                  ),

                  SizedBox(height: 12.h),

                  // 📝 التوضيح السفلي
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "* ",
                          style: TextStyle(
                            color: const Color(0xFFFF3B5C),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "We will send you a message to set or reset your new password",
                          style: TextStyle(
                            color: const Color(0xFF676767),
                            fontSize: 12.sp,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 36.h),

                  // 🔘 زر الإرسال مع الـ BlocConsumer أو Builder للوصول للـ Cubit
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loading: () => EasyLoading.show(
                            status: 'Sending...',
                            dismissOnTap: false,
                            maskType: EasyLoadingMaskType.black,
                            options: EasyLoadingOptions(
                              userInteractions: false,
                            ),
                          ),
                          error: (message) {
                            EasyLoading.dismiss();
                            UiUtils.showMessage(context, message);
                          },
                          success: () {
                            EasyLoading.dismiss();
                            UiUtils.showMessage(
                              context,
                              'A reset code has been sent to your email.',
                              isError: false,
                            );
                            context.push(
                              Routes.verifyCodeResetPassword,
                              extra: _emailController.text.trim(),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return ElevatedButtonEdit(
                          title: 'Send Code',
                          backgroundColor: ColorManager.error,
                          textColor: ColorManager.white,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ✅ الوصول للـ Cubit عبر الـ context الخاص بـ BlocProvider
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(_emailController.text.trim());
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
