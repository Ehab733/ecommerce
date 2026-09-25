import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FF),
      body: Stack(
        children: [
          // 🎨 1. خلفية متدرجة بلمسة ناعمة وتوهج زجاجي أعلى الشاشة
          Positioned(
            top: -100.h,
            left: -60.w,
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: Insets.s24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Sizes.s32.h),

                    // 1️⃣ عنوان الشاشة "Create an account"
                    Row(
                      children: [
                        Text(
                          'Create an\naccount',
                          style: getBoldStyle(
                            color: ColorManager.textPrimary,
                            fontsize: FontSize.s32.sp,
                          ).copyWith(height: 1.15, letterSpacing: -0.5),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(Insets.s12.r),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: ColorManager.primary,
                            size: 26.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.s28.h),

                    // 2️⃣ حقل الاسم بالكامل
                    TextFormFieldEdit(
                      controller: _fullNameController,
                      keyboardType: TextInputType.name,
                      label: 'Full Name',
                      prefixIcon: true,
                      icon: Icon(
                        Icons.person_outline_rounded,
                        color: ColorManager.textSecondary,
                        size: 20.sp,
                      ),
                      validator: (val) => Validator.validateFullName(val),
                    ),

                    SizedBox(height: Sizes.s16.h),

                    // 3️⃣ حقل البريد الإلكتروني
                    TextFormFieldEdit(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefixIcon: true,
                      icon: Icon(
                        Icons.email_outlined,
                        color: ColorManager.textSecondary,
                        size: 20.sp,
                      ),
                      validator: (val) => Validator.validateEmail(val),
                    ),

                    SizedBox(height: Sizes.s16.h),

                    // 4️⃣ حقل رقم الهاتف
                    TextFormFieldEdit(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      label: 'Phone Number',
                      maxLength: 11,
                      prefixIcon: true,
                      icon: Icon(
                        Icons.phone_outlined,
                        color: ColorManager.textSecondary,
                        size: 20.sp,
                      ),
                      validator: (val) => Validator.validatePhoneNumber(val),
                    ),

                    SizedBox(height: Sizes.s16.h),

                    // 5️⃣ حقل كلمة المرور
                    TextFormFieldEdit(
                      isPassword: true,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Password',
                      prefixIcon: true,
                      icon: Icon(
                        Icons.lock_outline_rounded,
                        color: ColorManager.textSecondary,
                        size: 20.sp,
                      ),
                      validator: (val) => Validator.validatePassword(val),
                    ),

                    SizedBox(height: Sizes.s16.h),

                    // 6️⃣ حقل تأكيد كلمة المرور
                    TextFormFieldEdit(
                      isPassword: true,
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Confirm Password',
                      prefixIcon: true,
                      icon: Icon(
                        Icons.lock_outline_rounded,
                        color: ColorManager.textSecondary,
                        size: 20.sp,
                      ),
                      validator: (val) {
                        if (val != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return Validator.validatePassword(val);
                      },
                    ),

                    SizedBox(height: Sizes.s16.h),

                    // 7️⃣ الشروط والأحكام
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.s4.w),
                      child: RichText(
                        text: TextSpan(
                          text: 'By clicking the ',
                          style: getRegularStyle(
                            color: ColorManager.textSecondary,
                            fontsize: FontSize.s11.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Create Account',
                              style: getBoldStyle(
                                color: ColorManager.primary,
                                fontsize: FontSize.s11.sp,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' button, you agree to our Terms and Conditions',
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: Sizes.s24.h),

                    // 8️⃣ زر إنشاء الحساب (BlocListener)
                    BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          registerLoading: () => EasyLoading.show(
                            dismissOnTap: false,
                            maskType: EasyLoadingMaskType.black,
                          ),
                          registerSuccess: () async {
                            await EasyLoading.dismiss();
                            if (context.mounted) {
                              context.go(Routes.getStartd);
                            }
                          },
                          registerError: (messageError) async {
                            await EasyLoading.dismiss();
                            if (context.mounted) {
                              UiUtils.showMessage(
                                context,
                                messageError,
                                isError: true,
                              );
                            }
                          },
                        );
                      },
                      child: Container(
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Sizes.s14.r),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                RegisterRequest(
                                  name: _fullNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  phone: _phoneController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  rePassword: _confirmPasswordController.text
                                      .trim(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: getBoldStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Sizes.s28.h),

                    // 9️⃣ فاصل "- OR Continue with -"
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorManager.lightGrey.withValues(
                              alpha: 0.5,
                            ),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s12.w,
                          ),
                          child: Text(
                            'OR Continue with',
                            style: getMediumStyle(
                              color: ColorManager.textSecondary,
                              fontsize: FontSize.s11.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: ColorManager.lightGrey.withValues(
                              alpha: 0.5,
                            ),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.s20.h),

                    // 🔟 أزرار وسائل التواصل الاجتماعي
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                            width: 22.w,
                            height: 22.h,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.g_mobiledata,
                              color: ColorManager.primary,
                              size: 28.sp,
                            ),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(width: Sizes.s16.w),
                        _buildSocialButton(
                          child: Icon(
                            Icons.apple,
                            size: 24.sp,
                            color: ColorManager.black,
                          ),
                          onTap: () {},
                        ),
                        SizedBox(width: Sizes.s16.w),
                        _buildSocialButton(
                          child: Icon(
                            Icons.facebook,
                            size: 24.sp,
                            color: const Color(0xFF1877F2),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.s28.h),

                    // 1️⃣1️⃣ رابط العودة لتسجيل الدخول
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                        onTap: () => context.go(Routes.login),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s12.w,
                            vertical: Insets.s6.h,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: "I Already Have an Account? ",
                              style: getRegularStyle(
                                color: ColorManager.textSecondary,
                                fontsize: FontSize.s13.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style:
                                      getBoldStyle(
                                        color: ColorManager.primary,
                                        fontsize: FontSize.s13.sp,
                                      ).copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Sizes.s24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Sizes.s14.r),
      child: Container(
        width: 56.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(Sizes.s14.r),
          border: Border.all(
            color: ColorManager.lightGrey.withValues(alpha: 0.4),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
