import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

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
    _addressController = TextEditingController(text: 'Beba, Beni Suef');
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s16.w,
          vertical: Insets.s12.h,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1️⃣ هيدر الملف الشخصي (Profile Avatar & Info Header)
              _buildProfileHeader(),
              SizedBox(height: Sizes.s24.h),

              // 2️⃣ حقول البيانات الشخصية (User Details Form)
              TextFormFieldEdit(
                label: 'Your full name',
                controller: _nameController,
                prefixIcon: true,
                icon: const Icon(Icons.person_outline_rounded),
              ),
              SizedBox(height: Sizes.s16.h),

              TextFormFieldEdit(
                label: 'Your E-mail',
                controller: _emailController,
                prefixIcon: true,
                icon: const Icon(Icons.email_outlined),
              ),
              SizedBox(height: Sizes.s16.h),

              TextFormFieldEdit(
                label: 'Your password',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: true,
                icon: const Icon(Icons.lock_outline_rounded),
              ),
              SizedBox(height: Sizes.s16.h),

              TextFormFieldEdit(
                label: 'Your mobile number',
                controller: _phoneController,
                prefixIcon: true,
                icon: const Icon(Icons.phone_android_outlined),
              ),
              SizedBox(height: Sizes.s16.h),

              TextFormFieldEdit(
                label: 'Your Address',
                controller: _addressController,
                prefixIcon: true,
                icon: const Icon(Icons.location_on_outlined),
              ),
              SizedBox(height: Sizes.s32.h),

              // 3️⃣ زر تسجيل الخروج (Logout Action)
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.whenOrNull(
                    logoutLoading: () => EasyLoading.show(
                      dismissOnTap: false,
                      maskType: EasyLoadingMaskType.black,
                    ),
                    logoutError: (messageError) async {
                      await EasyLoading.dismiss();
                      if (context.mounted) {
                        UiUtils.showMessage(context, messageError);
                      }
                    },
                    logoutSuccess: () async {
                      await EasyLoading.dismiss();
                      if (context.mounted) {
                        context.go(Routes.login);
                      }
                    },
                  );
                },
                child: ElevatedButtonEdit(
                  title: 'Logout',
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  backgroundColor: ColorManager.error.withValues(alpha: 0.1),
                  textColor: ColorManager.error,
                ),
              ),
              SizedBox(height: Sizes.s20.h),
            ],
          ),
        ),
      ),
    );
  }

  // 👤 ويدجيت هيدر المستخدم بصورة شخصية تفاعلية
  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(Insets.s16.r),
      decoration: BoxDecoration(
        color: ColorManager.primary.withAlpha(10),
        borderRadius: BorderRadius.circular(Sizes.s16.r),
        border: Border.all(
          color: ColorManager.primary.withAlpha(25),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          // الصورة الشخصية مع زر التعديل
          Stack(
            children: [
              CircleAvatar(
                radius: Sizes.s32.r,
                backgroundColor: ColorManager.primary,
                child: Text(
                  'EA',
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontsize: FontSize.s20,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: Sizes.s12.r,
                  backgroundColor: ColorManager.white,
                  child: Icon(
                    Icons.edit,
                    size: Sizes.s12.sp,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: Sizes.s16.w),

          // الاسم والبريد
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Ehab',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontsize: FontSize.s18,
                  ),
                ),
                SizedBox(height: Sizes.s4.h),
                Text(
                  'ehab@gmail.com',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                    color: ColorManager.grey,
                    fontsize: FontSize.s13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
