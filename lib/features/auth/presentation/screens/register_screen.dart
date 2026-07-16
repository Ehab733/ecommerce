import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth/auth_state.dart';
import 'package:ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  customText('Full name'),
                  SizedBox(height: Sizes.s8.h),
                  TextFormFieldEdit(
                    controller: _fullNameController,
                    label: 'enter your full name',
                    keyboardType: TextInputType.text,
                    validator: (val) => Validator.validateFullName(val),
                  ),
                  SizedBox(height: Sizes.s24.h),
                  customText('Mobile number'),
                  SizedBox(height: Sizes.s8.h),
                  TextFormFieldEdit(
                    controller: _phoneController,
                    label: 'enter your phone number',
                    keyboardType: TextInputType.phone,
                    maxLength: Sizes.s11,
                    validator: (val) => Validator.validatePhoneNumber(val),
                  ),
                  SizedBox(height: Sizes.s24.h),
                  customText('E-mail address'),
                  SizedBox(height: Sizes.s8.h),
                  TextFormFieldEdit(
                    controller: _emailController,
                    label: 'enter your email address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => Validator.validateEmail(val),
                  ),
                  SizedBox(height: Sizes.s24.h),

                  customText('Password'),
                  SizedBox(height: Sizes.s8.h),
                  TextFormFieldEdit(
                    isPassword: true,
                    controller: _passwordController,
                    label: 'enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) => Validator.validatePassword(val),
                  ),
                  SizedBox(height: Sizes.s50.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (_, state) {
                      if (state is RegisterLoading) {
                        UiUtils.showLoading(context);
                      } else if (state is RegisterSuccess) {
                        UiUtils.hideLoading(context);
                        Navigator.pushReplacementNamed(context, Routes.home);
                      } else if (state is RegisterError) {
                        UiUtils.hideLoading(context);
                        UiUtils.showMessage(state.messageError, isError: true);
                      }
                    },
                    child: ElevatedButtonEdit(
                      title: 'Register',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            RegisterRequest(
                              name: _fullNameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _phoneController.text.trim(),
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
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: Text(
                        'Already have an account? Login',
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
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
