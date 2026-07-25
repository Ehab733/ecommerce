import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s16.sp,
            vertical: Insets.s20.sp * 2,
          ),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      SvgAssets.logoSvg,
                      fit: BoxFit.cover,
                      width: Sizes.s235.w,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(height: Sizes.s50.h),
                  Text(
                    'Welcome Back To PixelForge',
                    style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontsize: FontSize.s24,
                    ),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white),
                  ),
                  SizedBox(height: Sizes.s40.h),

                  customText('Email'),
                  SizedBox(height: Sizes.s16.h),
                  TextFormFieldEdit(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'enter your email address',
                    validator: (val) => Validator.validateEmail(val),
                  ),
                  SizedBox(height: Sizes.s28.h),

                  customText('Password'),
                  SizedBox(height: Sizes.s16.h),
                  TextFormFieldEdit(
                    isPassword: true,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: 'enter your password',
                    validator: (val) => Validator.validatePassword(val),
                  ),
                  SizedBox(height: Sizes.s16.h),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot password',
                      style: getRegularStyle(
                        color: ColorManager.white,
                        fontsize: FontSize.s18,
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.s50.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        UiUtils.showLoading(context);
                      } else if (state is LoginSuccess) {
                        UiUtils.hideLoading(context);
                        Navigator.pushReplacementNamed(context, Routes.home);
                      } else if (state is LoginError) {
                        UiUtils.hideLoading(context);
                        UiUtils.showMessage(context,state.messageError, isError: true);
                      }
                    },
                    child: ElevatedButtonEdit(
                      title: 'Login',
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            LoginRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: Sizes.s28.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.register,
                        );
                      },
                      child: Text(
                        'Don’t have an account? Create Account',
                        style: getMediumStyle(
                          color: ColorManager.white,
                          fontsize: FontSize.s18,
                        ),
                      ),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

Widget customText(String text) => Text(
  text,
  style: getMediumStyle(color: ColorManager.white, fontsize: FontSize.s18),
);
