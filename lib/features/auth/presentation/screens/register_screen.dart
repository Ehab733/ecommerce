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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // الألوان المستخرجة بدقة من تصميم الشاشة
    const Color primaryRed = Color(0xFFF03E51);
    const Color textGrey = Color(0xFF575757);
    const Color hintGrey = Color(0xFF676767);
    const Color socialBorderColor = Color(0xFFF03E51);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: Insets.s24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Sizes.s32.h),

                // 1️⃣ عنوان "Create an account" العريض والكبير
                Text(
                  'Create an\naccount',
                  style: getBoldStyle(
                    color: Colors.black,
                    fontsize: FontSize.s32,
                  ).copyWith(height: 1.15),
                ),

                SizedBox(height: Sizes.s32.h),
                TextFormFieldEdit(
                  controller: _fullNameController,
                  keyboardType: TextInputType.text,
                  label: 'Full Name',
                  prefixIcon: true,
                  icon: const Icon(
                    Icons.person_outline_rounded,
                    color: hintGrey,
                  ),
                  validator: (val) => Validator.validateFullName(val),
                ),

                SizedBox(height: Sizes.s16.h),
                // 2️⃣ حقل البريد / اسم المستخدم
                TextFormFieldEdit(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email Address',
                  prefixIcon: true,
                  icon: const Icon(Icons.email_outlined, color: hintGrey),
                  validator: (val) => Validator.validateEmail(val),
                ),

                SizedBox(height: Sizes.s16.h),
                TextFormFieldEdit(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  label: 'Phone Number',
                  maxLength: 11,
                  prefixIcon: true,
                  icon: const Icon(Icons.phone_outlined, color: hintGrey),
                  validator: (val) => Validator.validatePhoneNumber(val),
                ),

                SizedBox(height: Sizes.s16.h),
                // 3️⃣ حقل كلمة المرور
                TextFormFieldEdit(
                  isPassword: true,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  label: 'Password',
                  prefixIcon: true,
                  icon: const Icon(Icons.lock_outline_rounded, color: hintGrey),
                  validator: (val) => Validator.validatePassword(val),
                ),

                SizedBox(height: Sizes.s16.h),

                // 4️⃣ حقل تأكيد كلمة المرور
                TextFormFieldEdit(
                  isPassword: true,
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  label: 'ConfirmPassword',
                  prefixIcon: true,
                  icon: const Icon(Icons.lock_outline_rounded, color: hintGrey),
                  validator: (val) {
                    if (val != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return Validator.validatePassword(val);
                  },
                ),

                SizedBox(height: Sizes.s16.h),

                // 5️⃣ نص الاتفاقية والتعهد (By clicking the Register button...)
                RichText(
                  text: TextSpan(
                    text: 'By clicking the ',
                    style: getRegularStyle(
                      color: hintGrey,
                      fontsize: FontSize.s12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: getRegularStyle(
                          color: primaryRed,
                          fontsize: FontSize.s12,
                        ),
                      ),
                      const TextSpan(
                        text: ' button, you agree to the public offer',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Sizes.s28.h),

                // 6️⃣ زر إنشاء الحساب (Create Account Button)
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      registerLoading: () => EasyLoading.show(
                        dismissOnTap: false,
                        options: EasyLoadingOptions(userInteractions: false),
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryRed,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s12.r),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            RegisterRequest(
                              name: _fullNameController.text.isEmpty
                                  ? _emailController.text.split('@').first
                                  : _fullNameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _phoneController.text.isEmpty
                                  ? '01000000000'
                                  : _phoneController.text.trim(),
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
                          color: Colors.white,
                          fontsize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Sizes.s32.h),

                // 7️⃣ فاصل "- OR Continue with -"
                Center(
                  child: Text(
                    '- OR Continue with -',
                    style: getMediumStyle(
                      color: textGrey,
                      fontsize: FontSize.s12,
                    ),
                  ),
                ),

                SizedBox(height: Sizes.s20.h),

                // 8️⃣ أزرار السوشيال ميديا (Google, Apple, Facebook)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      borderColor: socialBorderColor,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                        width: 24.w,
                        height: 24.h,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.g_mobiledata,
                              color: Colors.red,
                              size: 28,
                            ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(width: Sizes.s16.w),
                    _buildSocialButton(
                      borderColor: socialBorderColor,
                      child: Icon(
                        Icons.apple,
                        size: 28.sp,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(width: Sizes.s16.w),
                    _buildSocialButton(
                      borderColor: socialBorderColor,
                      child: Icon(
                        Icons.facebook,
                        size: 28.sp,
                        color: const Color(0xFF1877F2),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: Sizes.s28.h),

                // 9️⃣ رابط العودة لتسجيل الدخول "I Already Have an Account Login"
                Center(
                  child: GestureDetector(
                    onTap: () => context.go(Routes.login),
                    child: RichText(
                      text: TextSpan(
                        text: "I Already Have an Account ",
                        style: getRegularStyle(
                          color: textGrey,
                          fontsize: FontSize.s14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: getBoldStyle(
                              color: primaryRed,
                              fontsize: FontSize.s14,
                            ).copyWith(decoration: TextDecoration.underline),
                          ),
                        ],
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
    );
  }

  // ودجت بناء أزرار السوشيال ميديا الدائرية
  Widget _buildSocialButton({
    required Widget child,
    required VoidCallback onTap,
    required Color borderColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        width: 54.w,
        height: 54.h,
        padding: EdgeInsets.all(Insets.s12.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFCF3F4),
          border: Border.all(color: borderColor.withAlpha(77), width: 1),
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
