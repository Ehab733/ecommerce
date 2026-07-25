import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:flutter/material.dart';
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
    _nameController = TextEditingController(text: 'Mohamed Mohamed Nabil');
    _emailController = TextEditingController(text: 'mohamed.N@gmail.com');
    _passwordController = TextEditingController(text: '****************');
    _phoneController = TextEditingController(text: '01122118855');
    _addressController = TextEditingController(
      text: '6th October, street 11.....',
    );
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
              'Welcome, Mohamed',
              style: getBoldStyle(color: ColorManager.primary, fontsize: 18.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'mohamed.N@gmail.com',
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
          ],
        ),
      ),
    );
  }
}
