import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // الألوان المستخرجة من تصميم الواجهة الجديدة
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
                SizedBox(height: Sizes.s40.h),

                // 1️⃣ عنوان "Welcome Back!" العريض والكبير
                Text(
                  'Welcome\nBack!',
                  style: getBoldStyle(
                    color: Colors.black,
                    fontsize: FontSize.s32,
                  ).copyWith(height: 1.2),
                ),

                SizedBox(height: Sizes.s32.h),

                // 2️⃣ حقل اسم المستخدم / البريد الإلكتروني
                TextFormFieldEdit(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email Address',
                  prefixIcon: true,
                  icon: const Icon(
                    Icons.person_outline_rounded,
                    color: hintGrey,
                  ),
                  validator: (val) => Validator.validateEmail(val),
                ),

                SizedBox(height: Sizes.s20.h),

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

                SizedBox(height: Sizes.s12.h),

                // 4️⃣ رابط "Forgot Password?" باللون الأحمر الجانب الأيمن
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.push(Routes.forgetPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: getRegularStyle(
                        color: primaryRed,
                        fontsize: FontSize.s12,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Sizes.s32.h),

                // 5️⃣ زر تسجيل الدخول (Login Button)
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loginLoading: () => EasyLoading.show(
                        dismissOnTap: false,
                        options: EasyLoadingOptions(userInteractions: false),
                      ),
                      loginSuccess: () async {
                        await EasyLoading.dismiss();
                        if (context.mounted) {
                          context.go(Routes.getStartd);
                        }
                      },
                      loginError: (messageError) async {
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
                          context.read<AuthCubit>().login(
                            LoginRequest(
                              email: _emailController.text.trim(),
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Login',
                        style: getBoldStyle(
                          color: Colors.white,
                          fontsize: FontSize.s20,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Sizes.s40.h),

                // 6️⃣ فاصل "- OR Continue with -"
                Center(
                  child: Text(
                    '- OR Continue with -',
                    style: getMediumStyle(
                      color: textGrey,
                      fontsize: FontSize.s12,
                    ),
                  ),
                ),

                SizedBox(height: Sizes.s24.h),

                // 7️⃣ أزرار السوشيال ميديا (Google, Apple, Facebook)
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

                SizedBox(height: Sizes.s32.h),

                // 8️⃣ رابط إنشاء حساب جديد "Create An Account Sign Up"
                Center(
                  child: GestureDetector(
                    onTap: () => context.go(Routes.register),
                    child: RichText(
                      text: TextSpan(
                        text: "Create An Account ",
                        style: getRegularStyle(
                          color: textGrey,
                          fontsize: FontSize.s14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
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

                SizedBox(height: Sizes.s20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ودجت صغيرة لبناء أزرار السوشيال ميديا بشكل إحترافي
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
    super.dispose();
  }
}
