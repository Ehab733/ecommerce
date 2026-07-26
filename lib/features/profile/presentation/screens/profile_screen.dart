import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Ehab Ahmed');
    _emailController = TextEditingController(text: 'ehab@gmail.com');
    _passwordController = TextEditingController(text: 'Ehab123@');
    _phoneController = TextEditingController(text: '01212357118');
    _addressController = TextEditingController(text: 'Beba , bani suef , ...');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 💡 ترجع CustomScrollView مباشرة لأن الـ Scaffold والـ SafeArea موجودين في الشاشة الرئيسية
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1️⃣ قسم الترحيب والإيميل
            Text(
              'Welcome, Ehab',
              style: getBoldStyle(color: ColorManager.primary, fontsize: 18.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'ehab@gmail.com',
              style: getRegularStyle(
                color: ColorManager.primary.withAlpha(150),
                fontsize: 14.sp,
              ),
            ),
            SizedBox(height: 20.h),

            // 2️⃣ حقول البيانات
            TextFormFieldEdit(
              label: 'Your full name',
              controller: _nameController,
            ),
            SizedBox(height: 18.h),

            TextFormFieldEdit(
              label: 'Your E-mail',
              controller: _emailController,
            ),
            SizedBox(height: 18.h),

            TextFormFieldEdit(
              label: 'Your password',
              controller: _passwordController,
              isPassword: true,
            ),
            SizedBox(height: 18.h),

            TextFormFieldEdit(
              label: 'Your mobile number',
              controller: _phoneController,
            ),
            SizedBox(height: 18.h),

            TextFormFieldEdit(
              label: 'Your Address',
              controller: _addressController,
            ),
            SizedBox(height: 24.h),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LogoutLoading) {
                  UiUtils.showLoading(context);
                } else if (state is LogoutError) {
                  UiUtils.hideLoading(context);
                  UiUtils.showMessage(context, state.messageError);
                } else if (state is LogoutSuccess) {
                  // 🎯 التعديل هنا: LogoutSuccess بدلاً من LoginSuccess
                  UiUtils.hideLoading(context);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.login,
                    (route) => false, // يمسح كل الـ Stack السابقة
                  );
                }
              },
              child: ElevatedButtonEdit(
                title: 'Logout',
                onPressed: () {
                  final authCubit = context.read<AuthCubit>();
                  authCubit.logout();
                },
                backgroundColor: ColorManager.primary,
                textColor: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
